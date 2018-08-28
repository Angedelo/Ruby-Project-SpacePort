require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( '../models/ship.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/ship' do
  @ships = Ship.all
  erb (:"ship/index")
end

get '/ship/new' do
  @owners = Owner.all
  erb(:"ship/new")
end

get '/ship/:id' do
  @ship = Ship.find(params['id'].to_i)
  erb(:"ship/show")
end

post '/ship' do
  @ship = Ship.new(params)
  # binding.pry
  @ship.save
  erb(:"ship/create")
end
