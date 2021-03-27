# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Admin.create(email: 'admin@test.com', encrypted_password: 'password')

OrderDetail.create!(order_id: '1', item_id: '1', price: '2000', amount: '3', making_status: 0)