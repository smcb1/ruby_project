require_relative( '../db/sql_runner' )

class Inventory

  get '/inventory' do
    @manufacturers = Manufacturer.find_by_id(params['id'])
    @products = @manufacturers.id()
    erb ( :"inventory/index" )
  end
  
end
