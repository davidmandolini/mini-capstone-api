Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/products" => "products#index"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
