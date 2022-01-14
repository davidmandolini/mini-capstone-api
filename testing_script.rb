require "http"

response = HTTP.post("http://localhost:3000/products", :form => { :name => "Sega Saturn", :price => 150, :description => "A classic" })

response = HTTP.patch("http://localhost:3000/products/2", :form => { :name => "PS5", :price => 300, :description => "The best console" })

response = HTTP.delete("http://localhost:3000/products/5")
