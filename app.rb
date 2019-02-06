require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
require_relative('controllers/inventory_controller')
also_reload('../models/*')

get '/' do
  erb( :index )
end
