Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/all_products" => "products#all_products_method"
  get "/one_product" => "products#product_method"

  # Defines the root path route ("/")
  # root "articles#index"
end
