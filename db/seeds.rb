# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.create!(
  name: "admin",
  email: "admin@gmail.com",
  mobile: 9874561230,
  domain: "admin",
  description: "sample author",
  password: "adminadmin",
  password_confirmation: "adminadmin",
  admin: true
)
