require_relative( '../db/sql_runner' )

class Ship

  attr_reader( :name, :type, :size, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @size = options['size'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO ships
    (
      name,
      type,
      size
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @type, @size]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM ships"
    results = SqlRunner.run( sql )
    return results.map { |ship| Ship.new( ship ) }
  end

  def self.find( id )
    sql = "SELECT * FROM ships
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Ship.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM ships"
    SqlRunner.run( sql )
  end

end
