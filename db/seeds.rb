require 'faker'

puts "Reset users, products and materials..."
  Product.destroy_all
  Material.destroy_all
  User.destroy_all


puts "Creating our users..."

  celia   = User.create!(email: 'celia@celia.com',password: 'password')

  category = ["Pants","Shirt","Dress","Shorts","T-shirt","Sweat-shirt","Coat","Jacket","Skirt"]
  countries = ["China", "Bangladesh", "Italy", "Turkey", "India", "Tunisia", "Vietnam", "Portugal"]

puts "Creating our materials..."

acrylic = Material.create!(name: 'Acrylic', organic:false, recycled:false)
elastane = Material.create!(name: 'Elastane', organic:false, recycled:false)
polyamide = Material.create!(name: 'Polyamide', organic:false, recycled:false)
polyester = Material.create!(name: 'Polyester', organic:false, recycled:false)
recycled_polyester = Material.create!(name: 'Recycled polyester', organic:false, recycled:true)
cotton = Material.create!(name: 'Cotton', organic:false, recycled:false)
organic_cotton = Material.create!(name: 'Organic cotton', organic:true, recycled:false)
recycled_cotton = Material.create!(name: 'Recycled cotton', organic:false, recycled:true)
hemp = Material.create!(name: 'Hemp', organic:false, recycled:false)
organic_hemp = Material.create!(name: 'Organic hemp', organic:true, recycled:false)
recycled_hemp = Material.create!(name: 'Recycled hemp', organic:false, recycled:true)
linen = Material.create!(name: 'Linen', organic:false, recycled:false)
organic_linen = Material.create!(name: 'Organic linen', organic:true, recycled:false)
recycleed_linen = Material.create!(name: 'Recycled linen', organic:false, recycled:true)
wool = Material.create!(name: 'Wool', organic:false, recycled:false)
organic_wool = Material.create!(name: 'Organic wool', organic:true, recycled:false)
recycleed_wool = Material.create!(name: 'Recycled wool', organic:false, recycled:true)
silk = Material.create!(name: 'Silk', organic:false, recycled:false)
organic_silk = Material.create!(name: 'Organic silk', organic:true, recycled:false)
recycled_silk = Material.create!(name: 'Recycled silk', organic:false, recycled:true)
viscose = Material.create!(name: 'Viscose', organic:false, recycled:false)
lyocell_tencell = Material.create!(name: 'Lyocell / Tencell', organic:false, recycled:false)



puts "Creating our products..."

  product01 = Product.new(
    title:"Flowery pants",
    description:"Jimmy Hendrix wore the same pants at Woodstock ! I love them. I look like a clown with them but it's fine.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product01.save

  product02 = Product.new(
    title:"Itchy pullover",
    description:"I bought it in a thrift store in Berlin because I wanted a souvenir, but it is just itchy and smells like a basement.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product02.save

  product03 = Product.new(
    title:"Cool jeans",
    description:"I can not move in them, but they look cool. I can wear them on days when I don't have to sit. So practical !",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product03.save

  product04 = Product.new(
    title:"Stolen shirt",
    description:"This shirt belonged to my grand mother. I stole it. I have to tell her before it is too late.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product04.save

  product05 = Product.new(
    title:"Unwearable shirt",
    description:"I bought it because I taught it looked cool, but I just look like a child on her first communion. I will try to sell them.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product05.save

  product06 = Product.new(
    title:"Coolest t-shirt",
    description:"Looks vintage but I actually bought it new, it's not thrifted. Don't tell anyone or I will lose my street cred",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product06.save

  product07 = Product.new(
    title:"Cutest t-shirt",
    description:"It was the only time my best friend picked a good present for my birthday. I will keep it forever.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product07.save

  product08 = Product.new(
    title:"Oversized shirt",
    description:"Did not steal this one, I bought it new, I did not think twice, I have regrets.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product08.save

  product09 = Product.new(
    title:"Classic Pants",
    description:"I wear them when I want to be taken seriously. I'm not sure if it works, though.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product09.save

product10 = Product.new(
    title:"Man Jacket",
    description:"This is a good jacket, with good pockets, but I look like a creepy psychiatrist when I wear it. It's in good shape so I might sell it.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product10.save

product11 = Product.new(
    title:"Useless coat",
    description:"Why did I buy this ? It has the thickness of toilet paper and I'm freezing to death ! Impossible to sell, should I recycle ?",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product11.save

product12 = Product.new(
    title:"Another shirt",
    description:"Do I always wear the same style ? Where are the pants I'm wearing in this picture ? So many questions.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product12.save

product13 = Product.new(
    title:"Warm Jacket",
    description:"The best jacket ! Warm and cosy. Makes me forget about the crushing weight of daily responsibilities.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product13.save

product14 = Product.new(
    title:"White long skirt",
    description:"It is so frustrating not to be able to roll down a grassy hill when I'm wearing this. It looks good though.",
    brand:Faker::Kpop.solo,
    second_hand:[true,false].sample,
    category: category.sample,
    origin:countries.sample,
    user: celia,
    purchase_date:Faker::Date.between(from: 3.years.ago, to: 2.years.ago),
    discard_date:Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
  product14.save


  puts "Done !"
