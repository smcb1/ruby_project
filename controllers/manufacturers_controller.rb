require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/manufacturer.rb')
also_reload('../models/*')

get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb ( :"manufacturers/index" )
end

get '/manufacturers/new' do
  erb (:"manufacturers/new")
end

post '/manufacturers' do
  Manufacturer.new(params).save
  redirect to "/manufacturers"
end

get '/manufacturers/:id' do
  @manufacturers = Manufacturer.find(params['id'].to_i)
  erb(:"manufacturers/show")
end

get '/manufacturers/:id/edit' do
  @products = Product.all
  @manufacturers = Manufacturer.find(params['id'].to_i)
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id' do
  manufacturer = Manufacturer.new(params).update
  redirect to "/manufacturers/#{params['id']}"
end

post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.new(params).delete
  redirect to "/manufacturers"
end
