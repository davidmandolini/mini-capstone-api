Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/all_products", controller: "products", action: "all_products_method"
  # Defines the root path route ("/")
  # root "articles#index"
end
