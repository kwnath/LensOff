# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array = %w(old new used good)

3.times do
  Lense.create(
    name: Faker::Book.title,
    description: Faker::Book.publisher,
    price: Faker::Number.number(3),
    condition: array.sample )
end
