class Stylist
	attr_accessor(:id,:sname)
	def initialize(stylist_attrb)
		@id=stylist_attrb.fetch(:id)
		@sname=stylist_attrb.fetch(:name)
	end
	#method to save the stylist object to the database
	def save
		result=DB.exec("INSERT INTO stylists (name) VALUES ('#{@sname}') RETURNING id;")
		@id=result.first.fetch('id').to_i
	end

	#code to compare instances of the class
	def ==(stylist)
	 (self.class==stylist.class) && (self.sname==stylist.sname)
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
	#method to add client to the stylist...thus creating association
	def add_client(client_id)
		id=self.id.to_i
		DB.exec("UPDATE clients SET stylist_id=#{id} WHERE id=#{client_id};")
	end

	#method to update the attributes of the object in the database
	def update(attributes)
	 @sname=attributes.fetch(:name)
	 @id=self.id.to_i
	 DB.exec("UPDATE stylists SET name='#{@sname}' WHERE id=#{@id};")
	end

	def assigned_clients()
		array=[]
		selfid=self.id.to_i
		result=DB.exec("SELECT * FROM clients WHERE stylist_id=#{selfid};")
		result.each do |client|
			id=client.fetch('id').to_i
			cname=client.fetch('name')
			phone=client.fetch('phone')
			newc=Client.new({:id=>id,:name=>cname, :phone=>phone})
			array.push(newc)
		end
		array
	end
	def delete
	 #firstly remove alll the association that this stylist has in the clients table
	 DB.exec("UPDATE clients SET stylist_id=NULL WHERE stylist_id=#{self.id.to_i};")
	 #delete from the database aftr the relation is  broken with clients table
	 DB.exec("DELETE FROM stylists WHERE id=#{self.id.to_i};")
	end
end