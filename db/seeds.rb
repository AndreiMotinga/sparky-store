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

["Red", "23mm", "25mm", "deep", "straight", "rand"].map { |value| Spree::Value.create(name: value) }

Spree::Product.find_each do |p|
  Spree::Property.find_each do |prop|
    name = ["Red", "23mm", "25mm", "deep", "straight", "rand"].sample
    val = Spree::Value.find_by(name: name)
    p.product_properties.create(property: prop, value_id: val.id)
  end
end

Spree::Product.find_each do |p|
  name = "Red"
  val = Spree::Value.find_by(name: name)
  p.product_properties.create(property: Spree::Property.first, value_id: val.id)
end
