require_relative( '../db/sql_runner' )

class Category

  attr_accessor :category_type
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @category_type = options['category_type'].to_s
  end

  def save()
    sql = "INSERT INTO categories
    (
      category_type
    )
    VALUES
    (
      $1
    )
    RETURNING id;"
    values = [@category_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM categories;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Category.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM categories
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Category.new( results.first )
  end

  def update()
    sql = "UPDATE categories
    SET
    (
      category_type
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@category_type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM categories
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM categories;"
    SqlRunner.run( sql )
  end

end
