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
  @manufacturer = Manufacturer.find(params['id'].to_i)
  erb(:"manufacturers/show")
end

post '/manufacturers/:id' do
  manufacturer = Manufacturer.new(params).update
  # manufacturer.update
  redirect to "/manufacturers"
end

post '/manufacturers/:id/delete' do
  manufacturer = Manufacturer.new(params).delete
  redirect to "/manufacturers"
end
