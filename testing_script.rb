require "http"

response = HTTP.post("http://localhost:3000/products", :form => { :name => "Sega Saturn", :price => 150, :description => "A classic" })

response = HTTP.patch("http://localhost:3000/products/1", :form => { :name => "TV", :price => 150, :description => "A fun box of moving pictures." })

response = HTTP.delete("http://localhost:3000/products/6")
