Rails.application.routes.draw do

  constraints subdomain: /.*/ do
    resources :articles
  end

  # resources :articles
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
