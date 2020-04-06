require 'faker'

puts "Reset users, products and materials..."
  Product.destroy_all
  Material.destroy_all
  User.destroy_all


puts "Creating our user..."

  celia   = User.create!(email: 'celia@celia.com',password: 'password')

  category = ["Pants","Shirt","Dress","Shorts","T-shirt","Sweat-shirt","Coat","Jacket","Skirt"]
  countries = ["China", "Bangladesh", "Italy", "Turkey", "India", "Tunisia", "Vietnam", "Portugal"]

puts "Creating our materials..."

cotton = Material.create!(name: 'cotton', organic:false, recycled:false)
organic_cotton = Material.create!(name: 'organic cotton', organic:true, recycled:false)
recycled_cotton = Material.create!(name: 'recycled cotton', organic:false, recycled:true)
hemp = Material.create!(name: 'hemp', organic:false, recycled:false)
organic_hemp = Material.create!(name: 'organic hemp', organic:true, recycled:false)
recylced_hemp = Material.create!(name: 'recycled hemp', organic:false, recycled:true)
nylon = Material.create!(name: 'nylon', organic:false, recycled:false)
recycled_nylon = Material.create!(name: 'reycled nylon', organic:false, recycled:true)
polyester = Material.create!(name: 'polyester', organic:false, recycled:false)
recycled_polyester = Material.create!(name: 'recycled polyester', organic:false, recycled:true)
lyocell = Material.create!(name: 'lyocell')
rayon = Material.create!(name: 'rayon')


puts "Creating our products..."

30.times do |i|
  product = Product.new(
    title:Faker::Commerce.product_name,
    description:Faker::Lorem.sentence(word_count: 10),
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product.save
  end

  puts "Done !"
