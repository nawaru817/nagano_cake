# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Admin.create(email: 'admin@test.com', encrypted_password: 'password')

Order.create!(customer_id: '1', postal_code: '1114444', address: 'Ｊ県Ｊ市', name: '山田太郎', shipping_cost: '800', total_payment: '2800', payment_method: '0', status: '0')