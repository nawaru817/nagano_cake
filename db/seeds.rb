# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'admin@test.com', encrypted_password: 'password')
Customer.create!(last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', email: 'user1@test.com', password: 'password', postal_code: '1111111', address: 'Ａ県Ａ市', telephone_number: '09011111111')
Customer.create!(last_name: '田中', first_name: '二郎', last_name_kana: 'タナカ', first_name_kana: 'ジロウ', email: 'user2@test.com', password: 'password', postal_code: '2222222', address: 'Ｂ県Ｂ市', telephone_number: '09022222222')
Customer.create!(last_name: '斉藤', first_name: '三郎', last_name_kana: 'サイトウ', first_name_kana: 'サブロウ', email: 'user3@test.com', password: 'password', postal_code: '3333333', address: 'Ｃ県Ｃ市', telephone_number: '09033333333')