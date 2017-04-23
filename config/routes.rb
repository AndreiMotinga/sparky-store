Rails.application.routes.draw do
  get "home/about", as: :about
  get "home/contacts", as: :contacts
  get "home/delivery", as: :delivery
  get "home/catalogs", as: :catalogs
  mount Spree::Core::Engine, at: "/"
end
