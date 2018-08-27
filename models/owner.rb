require_relative( '../db/sql_runner' )

class Owner

  attr_reader( :name, :wanted_level, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @wanted_level = options['wanted_level']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name,
      wanted_level
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @wanted_level]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new( owner ) }
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

end
