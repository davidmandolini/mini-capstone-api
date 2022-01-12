Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/all_products", controller: "products", action: "all_products_method"
  get "/tv", controller: "products", action: "tv_method"
  get "/ps5", controller: "products", action: "ps5_method"
  get "/trash", controller: "products", action: "trash_method"
  # Defines the root path route ("/")
  # root "articles#index"
end
