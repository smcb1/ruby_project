require_relative( '../db/sql_runner' )

class Product

  attr_accessor(:id, :name, :product_type, :description, :price, :quantity)

  def save()
    sql = "INSERT INTO products
    (
      name,
      product_type,
      description,
      price,
      quantity
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @product_type, @description, @price, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |hash| Product.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Produt.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

end
