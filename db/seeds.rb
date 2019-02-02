require_relative( "../models/product.rb" )
require_relative( "../models/manufacturer.rb" )
require("pry-byebug")

Product.delete_all()
Manufacturer.delete_all()

manufacturer_1 = Manufacturer.new({
  "name" => "Nashville Banjo Company",
  "Product_type" => "Banjo",
  "contact" => "1 Wood Drive. Nashville, Tenessee. USA",
  "cost" => "1399"
})

manufacturer_1.save()

manufacturer_2 = Manufacturer.new({
  "name" => "Osborne Chief Banjo Company",
  "Product_type" => "Banjo",
  "contact" => "2356 Creek Hills. Nashville, Tennessee. USA",
  "cost" => "1399"
})

manufacturer_2.save()

manufacturer_3 = Manufacturer.new({
  "name" => "Elixir Strings Company",
  "Product_type" => "Strings",
  "contact" => "23 Cedar Hills. Texas. USA",
  "cost" => "8.99"
})

manufacturer_3.save()

manufacturer_4 = Manufacturer.new({
  "name" => "Snuffy Jenkins Banjo Bridges",
  "Product_type" => "Bridge",
  "contact" => "50 Wind Street. Knocksville, Tennessee. USA",
  "cost" => "35.99"
})

manufacturer_4.save()

product_1 = Product.new({
  "name" => "Nashville",
  "type" => "Banjo",
  "description" => "Nashville 5 string Banjo. Handmade in the USA.",
  "price" => "1500",
  "quantity" => "5"
})

product_1.save()

product_2 = Product.new({
  "name" => "Osborne Chief",
  "type" => "Banjo",
  "description" => "Osborne Chief 5 string Banjo. Handmade in the USA.",
  "price" => "1999",
  "quantity" => "2"
})
product_2.save()

product_3 = Product.new({
  "name" => "Elixir Strings",
  "type" => "Strings",
  "description" => "Elixir strings for 5 string Banjo. Made in Germany",
  "price" => "9.99",
  "quantity" => "230"
})
product_3.save()

product_4 = Product.new({
  "name" => "Snuffy Jenkins",
  "type" => "Bridge",
  "description" => "Snuffy Jenkins oak wood bridge for 5 string Banjo. Handmade in the USA",
  "price" => "39.99",
  "quantity" => "20"
})
product_4.save()

binding.pry
nil
