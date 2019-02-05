require_relative( '../db/sql_runner' )

class Manufacturer

  attr_accessor(:contact_name, :contact_address, :contact_number, :list_cost, :url)
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @contact_name = options['contact_name']
    @contact_address = options['contact_address']
    @contact_number = options['contact_number']
    @list_cost = options['list_cost'].to_f
    @url = options['url'].to_s
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      contact_name,
      contact_address,
      contact_number,
      list_cost,
      url
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id;"
    values = [@contact_name, @contact_address, @contact_number, @list_cost, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM manufacturers ORDER BY manufacturers.contact_name;"
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
      contact_name,
      contact_address,
      contact_number,
      list_cost,
      url
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@contact_name, @contact_address, @contact_number, @list_cost, @url, @id]
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
