require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturer' do
  @manufacturers = Manufacturer.all()
  erb ( :"products/index" )
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'].to_i)
  erb(:"manufacturer/show")
end
