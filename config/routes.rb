Rails.application.routes.draw do
  get "compare", to: "compare#index"
  get "home/about", as: :about
  get "home/contacts", as: :contacts
  get ".well-known/acme-challenge/CwQCcz0QWevcEq_EBM_RIvFvTuPN6TKd1XrwzxkkcNg", to: "home#key"
  mount Spree::Core::Engine, at: "/"
end
