# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  Product.create!([{name: "Alley Cat", price: 1},
                   {name: "Pure Persian Cat", price: 1000001},
                   {name: "Bengal Cat", price: 100050},
                   {name: "Sickly Lion", price: 5}]
                 )
end