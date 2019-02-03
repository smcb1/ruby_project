require_relative( '../db/sql_runner' )

class Product

  attr_accessor(:name, :manufacturer_id, :product_type, :description, :price, :quantity, :url)
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @manufacturer_id = options['manufacturer_id']
    @product_type = options['product_type']
    @description = options['description']
    @price = options['price'].to_s
    @quantity = options['quantity'].to_i
    @url = options['url'].to_s
  end

  def save()
    sql = "INSERT INTO products
    (
      name,
      manufacturer_id,
      product_type,
      description,
      price,
      quantity,
      url
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id;"
    values = [@name, @manufacturer_id, @product_type, @description, @price, @quantity, @url]
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
      name,
      manufacturer_id,
      product_type,
      description,
      price,
      quantity,
      url
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@name, @manufacturer_id, @product_type, @description, @price, @quantity, @url, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM products
      WHERE id = $1"
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

    def manufacturer_name(id)
      sql = "SELECT m.name FROM manufacturer "
    end

  end
