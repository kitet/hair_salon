class Client
	attr_accessor(:id,:cname,:phone)

	def initialize(client_attrib)
		@id=client_attrib.fetch(:id)
		@cname=client_attrib.fetch(:name)
		@phone=client_attrib.fetch(:phone)
	end

	#method to save created Client object to db
	def save
		result=DB.exec("INSERT INTO clients (name,phone) VALUES ('#{@cname}','#{@phone}') RETURNING id;")
		@id=result.first.fetch('id').to_i
	end

	def self.all
		clients=[]
		query_result=DB.exec("SELECT * FROM clients WHERE stylist_id IS NULL;")
		query_result.each do |client|
			cname=client.fetch('name')
			id=client.fetch('id')
			phone=client.fetch('phone')
			new_client=Client.new({:id=>id,:name=>cname, phone: phone})
			clients.push(new_client)
		end
		clients
	end

	def self.find(id)
		found_client=nil
		Client.all.each do |client|
			client.id.to_i==id ? found_client=client : "do nothing"
		end
		found_client
	end
	#code to compare instances of the class
	def ==(client)
	 (self.class==client.class) && (self.cname==client.cname)
	end
	#method to update name as the only parameter changeable
	def update(attributes)
	 @name=attributes.fetch(:name)
	 @id=self.id.to_i
	 DB.exec("UPDATE clients SET name ='#{@name}' WHERE id=#{@id};")
	end

	def delete
	 DB.exec("DELETE FROM clients WHERE id=#{self.id.to_i};")
	end
end

