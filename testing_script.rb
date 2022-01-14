require "http"

response = HTTP.get("http://localhost:3000/products/1")
message = JSON.parse(response.body)
p message["name"]
#response = HTTP.patch("http://localhost:3000/products/2", :form => { :name => "PS5", :price => 300, :description => "The best console" })

#response = HTTP.delete("http://localhost:3000/products/5")
