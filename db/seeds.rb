# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product = Product.new(:name => "TV", :price => 300, :img_url => nil, :description => "Fun box of moving pictures")
product.save

product = Product.new(:name => "PS5", :price => 400, :img_url => nil, :description => "The best console")
product.save

product = Product.new(:name => "Trash", :price => 15, :img_url => nil, :description => "Storage for your Nintendo Switch")
product.save
