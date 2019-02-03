require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/inventory.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/product.rb')
also_reload( '../models/*' )

get '/inventory' do
  # @products = Product.all()
  # @manufacturers = Manufacturer.all()
  erb (:"inventory/index")
end
