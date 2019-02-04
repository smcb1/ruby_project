require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')
also_reload('../models/*')

get '/products' do
  @products = Product.all()
  erb (:"products/index")
end

get '/products/new' do
  @categories = Category.all
  @manufacturers = Manufacturer.all
  erb (:"products/new")
end

post '/products' do
  Product.new(params).save
  redirect to "/products"
end

get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb(:"products/show")
end

get '/products/:id/edit' do
  # @categories = Category.all
  @manufacturers = Manufacturer.all
  @product = Product.find(params['id'])
  erb(:"products/edit")
end

post '/products/:id' do
  product = Product.new(params).update
  redirect to "/products/#{params['id']}"
end

post '/products/:id/delete' do
  product = Product.new(params).delete
  redirect to "/products"
end
