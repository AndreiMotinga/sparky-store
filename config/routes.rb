Rails.application.routes.draw do
  get "home/about", as: :about
  get "home/contacts", as: :contacts
  mount Spree::Core::Engine, at: "/"
end
