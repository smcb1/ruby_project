require_relative( '../db/sql_runner' )

class Manufacturer

  attr_accessor(:id, :name, :product_type, :contact, :cost)

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      product_type,
      contact,
      cost
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @product_type, @contact, @cost]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Manufacturer.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Manufacturer.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run( sql )
  end

end
