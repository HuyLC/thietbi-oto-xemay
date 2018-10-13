# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker

Admin.create(email: 'admin@gmail.com', password: '1234567890', password_confirmation: '1234567890')

5.times do
  Category.create(
    name: Faker::Name.name,
    slug: Faker::Name.last_name
  )
end

10.times do
  SubCategory.create(
    name: Faker::Name.name,
    slug: Faker::Name.last_name,
    category_id: Category.order('RAND()').first.id
  )
end

50.times do
  Product.create(
    sub_category_id: SubCategory.order('RAND()').first.id,
    name: Faker::Name.name,
    slug: Faker::Name.last_name,
    price: 'Liên Hệ',
    code:  Faker::Code.nric,
    rating: 4.5,
    origin: Faker::WorldCup.team,
    status: 'New',
    description: Faker::Name.name,
    photo_1: Faker::Avatar.image,
    photo_2: Faker::Avatar.image,
    photo_3: Faker::Avatar.image
  )
end
