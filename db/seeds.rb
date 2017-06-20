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
    condition: array.sample,
    brandname: Faker::Book.title,
    aperture_min: Faker::Number.number(1),
    aperture_max: Faker::Number.number(1),
    focal_length_min: Faker::Number.number(1),
    focal_length_max: Faker::Number.number(1),
    image_stabilization: Faker::Boolean.boolean,
    mount_type: Faker::Book.publisher,
    camera_type: Faker::Book.publisher   )
end
