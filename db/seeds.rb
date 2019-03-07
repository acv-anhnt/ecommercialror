# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

Category.destroy_all
Product.destroy_all

if ActiveRecord::Base.connection.adapter_name == 'Mysql2'
  ActiveRecord::Base.connection.execute(
    'ALTER TABLE products AUTO_INCREMENT = 1'
  )
  ActiveRecord::Base.connection.execute(
    'ALTER TABLE categories AUTO_INCREMENT = 1'
  )
end

product_url = 'https://fake-products-api.herokuapp.com/products'
category_url = 'https://fake-products-api.herokuapp.com/categories'

product_uri = URI(product_url)
category_uri = URI(category_url)

products_response = Net::HTTP.get(product_uri)
products_array = JSON.parse(products_response)

categories_response = Net::HTTP.get(category_uri)
categories_array = JSON.parse(categories_response)

categories_array.each do |item|
  puts item['title']
  Category.create(title: item['title'])
end

products_array.each do |a|
  puts a['id']
  Product.create(title: a['title'], description: a['description'], price: a['price'], image_url: a['image_url'], post_at: a['post_at'], category_id: a['category_id'])
end