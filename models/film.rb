require_relative("../db/sql_runner")



class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films(title, price)
    values( $1, $2)
    RETURNING id"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    results = films.map{|film| Film.new( film )}
    return results
  end

  def update()
    sql = "SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def customer()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    customer = results.map{|customer| Customer.new( customer )}
    return customer
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end
end
