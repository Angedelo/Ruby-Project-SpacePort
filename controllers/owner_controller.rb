require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( '../models/ship.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/owner' do
  @owners = Owner.all
  erb (:"owner/index")
end

get '/owner/new' do
  erb(:"owner/new")
end

get '/owner/:id' do
  @owner = Owner.find(params[:id].to_i)
  @ships = @owner.ship
  # binding.pry
  erb(:"owner/show")
end

post '/owner' do
  @owner = Owner.new(params)
  # binding.pry
  @owner.save
  erb(:"owner/create")
end

post '/owner/:id/delete' do
  owner = Owner.find(params[:id].to_i)
  owner.delete
  redirect to '/owner'
end

get '/owner/:id/edit' do
  @owner = Owner.find(params[:id].to_i)
  erb(:"owner/edit")
end

post '/owner/:id' do
  Owner.new( params ).update
  redirect to '/owner'
end
