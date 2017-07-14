require "pg"
require "sinatra/reloader"
require "sinatra"
require "./lib/client.rb"
require "./lib/stylist.rb"
also_reload('lib/**/*.rb')

DB=PG.connect(:dbname=>"hair_salon")

get '/' do
	erb :index
end

get '/owner' do
	@stylists=Stylist.all
	@clients=Client.all
	erb :owner
end

post '/owner/stylist/new' do
	sname=params.fetch('name')
	stylist=Stylist.new(id:nil,name:sname)
	stylist.save
	redirect '/owner'
end

post '/owner/client/new' do
	client_name=params.fetch('name')
	phone=params.fetch('phone')
	client=Client.new(id: nil,name: client_name, phone: phone)
	client.save
	redirect '/owner'
end

get '/owner/stylist/:id' do
	@stylist=Stylist.find(params.fetch('id').to_i)
	@clients=Client.all
	erb :stylist
end

get '/owner/client/:id' do
	@client=Client.find(params.fetch('id').to_i)
	erb :client
end
