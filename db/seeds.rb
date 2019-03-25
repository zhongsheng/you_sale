# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = %w(食品 工具 日化 粮油 生鲜 营养保健)

categories.each { |cate|
  p "Insert: #{cate}"
  Category.create({name: cate})
}

contries = %w(中国 台湾 美国 乌克兰)
contries.each { |contry|
  p "Insert contry: #{contry}"
  Contry.create({name: contry})
}

User.create( {email: '444133866@qq.com', password: '123123gh'} )
