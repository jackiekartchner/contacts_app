# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contact = Contact.new(
  first_name: "Eric",
  last_name: "Anderson",
  email: "eric.anderson@gmail.com",
  phone_number: "925-291-3213"
  )
contact.save

contact = Contact.new(
  first_name: "David",
  last_name: "Kartchner",
  email: "david.kartchner@gmail.com",
  phone_number: "925-243-3093"
  )
contact.save

contact = Contact.new(
  first_name: "Susan",
  last_name: "Kerr",
  email: "susan.kerr@gmail.com",
  phone_number: "925-121-0913"
  )
contact.save

