Rails.application.routes.draw do
  get "home/about", as: :about
  mount Spree::Core::Engine, at: "/"
end
