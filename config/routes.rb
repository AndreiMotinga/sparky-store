Rails.application.routes.draw do
  get "compare", to: "compare#index"
  get "home/about", as: :about
  get "home/contacts", as: :contacts
  get "sitemaps/sitemap.:format.:compression", to: "sitemap#show"
  get "sitemaps/sitemap:id.:format.:compression", to: "sitemap#show_id"
  mount Spree::Core::Engine, at: "/"
end
