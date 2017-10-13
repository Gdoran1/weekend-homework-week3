require_relative("../db/sql_runner")
require_relative("film.rb")
require_relative("customer.rb")

class Tickets

  attr_reader :id, :customer_id, :film_id


  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets(customer_id, film_id)
    values( $1, $2)
    RETURNING id"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    results = tickets.map{|ticket| Tickets.new( tickets )}
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end
end
