require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/tickets.rb')
require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Tickets.delete_all()


customer1 = Customer.new({'name' => 'Craig Doran', 'funds' => 20})
customer1.save()

customer2 = Customer.new({'name' => 'Struan Doran', 'funds' => 20})
customer2.save()

customer3 = Customer.new({'name' => 'Graeme Doran', 'funds' => 50})
customer3.save()


film1 = Film.new({'title' => 'Star Wars', 'price' => 5 })
film1.save()

film2 = Film.new({'title' => 'Alien', 'price' => 7})
film2.save()

film3 = Film.new({'title' => 'Blade Runner', 'price' => 6})
film3.save()

film4 = Film.new({'title' => 'Dune', 'price' => 3})
film4.save()


ticket1 = Tickets.new({'film_id' => film2.id, 'customer_id' => customer3.id})
ticket1.save()

ticket2 = Tickets.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket2.save()

ticket3 = Tickets.new({'film_id' => film4.id, 'customer_id' => customer2.id})
ticket3.save()

ticket4 = Tickets.new({'film_id' => film3.id, 'customer_id' => customer3.id})
ticket4.save()

ticket5 = Tickets.new({'film_id' => film1.id, 'customer_id' => customer3.id})
ticket5.save()

ticket6 = Tickets.new({'film_id' => film3.id, 'customer_id' => customer1.id})
ticket6.save()

ticket7 = Tickets.new({'film_id' => film3.id, 'customer_id' => customer2.id})
ticket7.save()

ticket8 = Tickets.new({'film_id' => film4.id, 'customer_id' => customer3.id})
ticket8.save()

binding.pry
nil
