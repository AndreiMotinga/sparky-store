# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Spree::Country.find_or_create_by(
#   iso_name: "MOLDOVA, REPUBLIC OF",
#   iso: "MD",
#   iso3: "MDA",
#   name: "Moldova, Republic of",
# )

Spree::ProductProperty.delete_all
Spree::Property.delete_all
Spree::Property.create(name: "Зернистость диска", presentation: "Зернистость диска")
Spree::Property.create(name: "Площать шлифования", presentation: "Площать шлифования")
Spree::Property.create(name: "Класс защиты", presentation: "Класс защиты")

Spree::Product.find_each do |p|
  Spree::Property.find_each do |prop|
    p.product_properties.create(property: prop, value: ["Red", "23mm", "25mm", "deep", "straight", "rand"].sample)
  end
end
