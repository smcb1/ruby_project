require_relative('../db/sql_runner')

class Inventory

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id'].to_i
    @category_id = options['category_id'].to_i
    @category_type = options['category_type']
    @manufacturer_id = options['manufacturer_id'].to_i
    @manufacturer_name = options['manufacturer_name']
  end

end
