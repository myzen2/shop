# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(
  title: "Mug",
  description: "Un joli mug pour votre café",
  price: 12.5,
  image_url: "une_image.jpg")

Product.create(
  title: "T-shirt",
  description: "Parfait pour le sport",
  price: 25,
  image_url: "tshirt.jpg")
Product.create(
  title: "Vélo",
  description: "Un vélo pour faire du sport",
  price: 152.5,
  image_url: "un_velo.jpg")

Product.create(
  title: "TV",
  description: "Vous pourrez regarder toutes vos émissions préférées",
  price: 598.99,
  image_url: "tv.jpg")

  puts "Vous venez de créer  #{Product.count} produits"
