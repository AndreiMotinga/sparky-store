Rails.application.routes.draw do
  get "compare", to: "compare#index"
  get "home/about", as: :about
  get "home/contacts", as: :contacts
  mount Spree::Core::Engine, at: "/"
end
