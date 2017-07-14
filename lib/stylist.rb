class Stylist
	attr_accessor(:id,:sname)
	def initialize(stylist_attrb)
		@id=stylist_attrb.fetch(:id)
		@sname=stylist_attrb.fetch(:name)
	end

	def save
		DB.exec("INSERT INTO stylists (name) VALUES ('#{@sname}');")
	end

	def self.all
		stylists=[]
		query_result=DB.exec("SELECT * FROM stylists;")
		query_result.each do |stylist|
			sname=stylist.fetch('name')
			id=stylist.fetch('id')
			new_stylist=Stylist.new({:id=>id,:name=>sname})
			stylists.push(new_stylist)
		end
		stylists
	end

	def self.find(identification)
		found_stylist=nil
		Stylist.all.each do |stylist|
			stylist.id.to_i==identification ? found_stylist=stylist : "do nothing"
		end
		found_stylist
	end
end