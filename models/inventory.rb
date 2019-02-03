require_relative( '../db/sql_runner' )

class Inventory

  # attr_accessor(:name, :product_type, :contact, :cost, :url)
  # attr_reader :id
  #
  # def initialize( options )
  #   @id = options['id'].to_i if options['id']
  #   @name = options['name']
  #   @product_type = options['product_type']
  #   @contact = options['contact']
  #   @cost = options['cost'].to_i
  #   @url = options['url'].to_s
  # end


  get '/inventory' do
    @manufacturers = Manufacturer.find_by_id(params['id'])
    @products = @manufacturers.id()
    erb ( :"inventory/index" )

  end
