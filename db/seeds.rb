country = Spree::Country.find_or_create_by(
  iso_name: "MOLDOVA, REPUBLIC OF",
  iso: "MD",
  iso3: "MDA",
  name: "Moldova, Republic of",
)

shipping_cateogry = Spree::ShippingCategory.find_or_create_by(
  name: "Default"
)

shipping_method = Spree::ShippingMethod.find_or_create_by(
  admin_name: "курьер",
  code: "курьер",
  available_to_all: true,
  available_to_users: true
)

zone = Spree::Zone.find_or_create_by(
  name: "Молдова",
  description: "Молдова",
  default_tax: true,
  kind: "country"
)
