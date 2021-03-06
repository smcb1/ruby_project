require_relative( "../models/product.rb" )
require_relative( "../models/manufacturer.rb" )
require_relative( "../models/category.rb" )
require("pry-byebug")

Product.delete_all()
Manufacturer.delete_all()
Category.delete_all()

category_1 = Category.new({
  "category_type" => "Banjo"
})
category_1.save()

category_2 = Category.new({
  "category_type" => "Strings"
})
category_2.save()

category_3 = Category.new({
  "category_type" => "Tone Ring"
})
category_3.save()

category_4 = Category.new({
  "category_type" => "Picks"
})
category_4.save()

category_5 = Category.new({
  "category_type" => "Bridge"
})
category_5.save()

category_6 = Category.new({
  "category_type" => "Straps"
})
category_6.save()

category_7 = Category.new({
  "category_type" => "Books"
})
category_7.save()

manufacturer_1 = Manufacturer.new({
  "contact_name" => "Deering Banjo Company",
  "contact_address" => "1 Wood Drive. Nashville, Tenessee. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "1399.99",
  "url" => "images/deering_logo.jpg"
})

manufacturer_1.save

manufacturer_2 = Manufacturer.new({
  "contact_name" => "Osborne Chief Banjo Company",
  "contact_address" => "2356 Creek Hills. Nashville, Tennessee. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "1599.99",
  "url" => "images/osborne_logo.jpg"
})

manufacturer_2.save

manufacturer_3 = Manufacturer.new({
  "contact_name" => "Elixir Strings Company",
  "contact_address" => "23 Cedar Hills. Texas. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "8.99",
  "url" => "images/elixir_logo.jpg"
})

manufacturer_3.save

manufacturer_4 = Manufacturer.new({
  "contact_name" => "Snuffy Jenkins Banjo Bridges",
  "contact_address" => "50 Wind Street. Knocksville, Tennessee. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "35.99",
  "url" => "images/snuffy_logo.jpg"
})

manufacturer_4.save

manufacturer_5 = Manufacturer.new({
  "contact_name" => "Hal Leonard Books",
  "contact_address" => "5 George Street. Knocksville, Kentucky. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "11.99",
  "url" => "images/hal_logo.jpg"
})

manufacturer_5.save

manufacturer_6 = Manufacturer.new({
  "contact_name" => "Bill Blaylock",
  "contact_address" => "Hill Farm. Springfield, Ohio. USA",
  "contact_number" => "456 789 1234",
  "list_cost" => "449.99",
  "url" => "images/hal_logo.jpg"
})

manufacturer_6.save


product_1 = Product.new({
  "category_id" => 1,
  "manufacturer_id" => 1,
  "product_name" => "Goodtime II",
  "description" => "Deering Goodtime II 5 string Banjo. Handmade in the USA.",
  "list_price" => "1599.99",
  "quantity" => 5,
  "url" => "images/deering_banjo.jpg"
})

product_1.save

product_2 = Product.new({
  "category_id" => 1,
  "manufacturer_id" => 2,
  "product_name" => "The Chief",
  "description" => "Osborne Chief 5 string Banjo. Handmade in the USA.",
  "list_price" => "1999.99",
  "quantity" => 2,
  "url" => "images/osborne_chief.jpg"
})
product_2.save

product_3 = Product.new({
  "category_id" => 2,
  "manufacturer_id" => 3,
  "product_name" => "Elixir Strings",
  "description" => "Elixir strings for 5 string Banjo.",
  "list_price" => "9.99",
  "quantity" => "230",
  "url" => "images/elixir_strings.jpg"

})
product_3.save

product_4 = Product.new({
  "category_id" => 5,
  "manufacturer_id" => 4,
  "product_name" => "Snuffy Banjo Bridge",
  "description" => "Snuffy Jenkins oak wood bridge for 5 string Banjo. Handmade in the USA",
  "list_price" => "39.99",
  "quantity" => 20,
  "url" => "images/snuffy_bridge.jpg"
})
product_4.save

product_5 = Product.new({
  "category_id" => 2,
  "manufacturer_id" => 1,
  "product_name" => "Deering Banjo Strings",
  "description" => "Deering's high quality Banjo Strings.",
  "list_price" => "9.99",
  "quantity" => 200,
  "url" => "images/deering_strings.jpg"
})
product_5.save

product_6 = Product.new({
  "category_id" => 7,
  "manufacturer_id" => 5,
  "product_name" => "Master the banjo with Earl Scruggs",
  "description" => "Earl Scurggs teaches his unique banjo stlye named after him; Scruggs Style.",
  "list_price" => "13.99",
  "quantity" => 200,
  "url" => "images/scruggs_book.jpg"
})
product_6.save

product_7 = Product.new({
  "category_id" => 3,
  "manufacturer_id" => 6,
  "product_name" => "Blaylock Brass Tone Ring",
  "description" => "Bill Blaylocks tone rings, hand made in USA. .",
  "list_price" => "599.99",
  "quantity" => 8,
  "url" => "images/tone_ring.jpg"
})
product_7.save

binding.pry
nil
