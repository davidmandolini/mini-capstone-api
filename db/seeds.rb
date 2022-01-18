# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
supplier = Supplier.new(:name => "Panasonic", :email => "support@panasonic.com", :phone_number => "1-800-123-4567")
supplier.save

supplier = Supplier.new(:name => "Sony", :email => "support@sony.com", :phone_number => "1-800-123-4567")
supplier.save

supplier = Supplier.new(:name => "ACE Hardware", :email => "support@ace.com", :phone_number => "1-800-123-4567")
supplier.save

product = Product.new(:supplier_id => 1, :name => "TV", :price => 300, :description => "Fun box of moving pictures")
product.save

product = Product.new(:supplier_id => 2, :name => "PS5", :price => 400, :description => "The best console")
product.save

product = Product.new(:supplier_id => 3, :name => "Trash", :price => 15, :description => "Storage for your Nintendo Switch")
product.save
