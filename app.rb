require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')
#require_relative('controllers/inventory_controller')

get '/' do
  erb( :index )
end
