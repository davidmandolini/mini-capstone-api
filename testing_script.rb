require "http"

response = HTTP.get("http://localhost:3000/products")
product_data = JSON.parse(response.body)
p product_data
