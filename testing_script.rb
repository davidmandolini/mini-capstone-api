require "http"

response = HTTP.post("http://localhost:3000/products", :form => { :name => "Sega Saturn", :price => 150, :description => "A classic" })
