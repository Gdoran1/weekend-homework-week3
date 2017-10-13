require_relative("../db/sql_runner")
require_relative("customer.rb")


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers(name, funds)
    values( $1, $2)
    RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    results = customers.map{|customer| Customer.new( customer )}
    return results
  end

  def update()
    sql = "SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def film()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE customer_id =$1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    film = results.map{|film| Film.new( film )}
    return film
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end
end
