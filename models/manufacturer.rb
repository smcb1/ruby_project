require_relative( '../db/sql_runner' )

class Manufacturer

  attr_accessor(:name, :product_type, :contact, :cost, :url)
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @product_type = options['product_type']
    @contact = options['contact']
    @cost = options['cost'].to_s
    @url = options['url'].to_s
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      product_type,
      contact,
      cost,
      url
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id;"
    values = [@name, @product_type, @contact, @cost, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM manufacturers;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Manufacturer.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM manufacturers
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Manufacturer.new( results.first )
  end

  def update()
    sql = "UPDATE manufacturers
    SET
    (
      name,
      product_type,
      contact,
      cost,
      url
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @product_type, @contact, @cost, @url, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM manufacturers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers;"
    SqlRunner.run( sql )
  end

end
