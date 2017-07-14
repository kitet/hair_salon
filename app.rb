require "pg"
require "sinatra/reloader"
require "sinatra"
require "./lib/client.rb"
require "./lib/stylist.rb"
also_reload('lib/**/*.rb')

DB=PG.connect(:dbname=>"hair_salon_test")

get '/' do
	erb :index
end