require_relative( '../db/sql_runner' )

class Product

  attr_accessor(:category_id, :manufacturer_id, :product_name, :description, :list_price, :quantity, :url)
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category_id = options['category_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @product_name = options['product_name']
    @description = options['description']
    @list_price = options['list_price'].to_f
    @quantity = options['quantity'].to_i
    @url = options['url'].to_s
  end

  def save()
    sql = "INSERT INTO products
    (
      category_id,
      manufacturer_id,
      product_name,
      description,
      list_price,
      quantity,
      url
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id;"
    values = [@category_id, @manufacturer_id, @product_name, @description, @list_price, @quantity, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM products;"
    results = SqlRunner.run(sql)
    return results.map { |h| Product.new(h) }
  end

  def self.find( id )
    sql = "SELECT * FROM products
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Product.new(results.first)
  end

  def update()
    sql = "UPDATE products
    SET
    (
      category_id,
      manufacturer_id,
      product_name,
      description,
      list_price,
      quantity,
      url
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8;"
      values = [@category_id, @manufacturer_id, @product_name, @description, @list_price, @quantity, @url, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM products
      WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM products;"
      SqlRunner.run(sql)
    end

    def self.map_items(product_hash)
      return product_hash.map { |p| Product.new(p) }
    end

    def get_category()
      sql = "SELECT categories.category_type
      FROM categories WHERE categories.id = $1;"
      values = [@category_id]
      results = SqlRunner.run(sql, values)
      return results[0]["category_type"]
    end

    def get_manufacturer()
      sql = "SELECT manufacturers.contact_name
      FROM manufacturers WHERE manufacturers.id = $1;"
      values = [@manufacturer_id]
      results = SqlRunner.run(sql, values)
      return results[0]["contact_name"]
    end

  end
