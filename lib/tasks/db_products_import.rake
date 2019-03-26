# coding: utf-8
# 品类,商品产地,商品名称,规格,箱规,批发价,市场零售价,保质期

desc "导入产品"
namespace :db_import do
  task :products => :environment do
    require 'csv'
    csv_file = Rails.root.join("db/products-1.csv")
    first_row = nil
    contries = Set.new
    categories = Set.new
    products = []
    CSV.foreach(csv_file) do |row|
      if first_row == nil
        first_row = row
        next
      end
      contries << row[1]
      categories << row[0]
      products << row
    end

    cate_hash = categories.map { |cate|
      p "Insert: #{cate}"
      [cate, Category.create({name: cate}).id]
    }.to_h

    pp cate_hash

    contries = contries - Set[nil]
    contries_hash = contries.map { |contry|
      p "Insert contry: #{contry}"
      [contry, Contry.create({name: contry}).id ]
    }.to_h

    pp contries_hash

    products.each do |row|
      row[2].gsub!("\n", ' ')
      row[2].gsub!("\s+", ' ')
      p "Insert Product #{row[2]}"
      Product.create({
                       name: row[2],
                       contry_id: contries_hash[row[1]],
                       category_id: cate_hash[row[0]],
                       weight: row[3],
                       specification: row[4],
                       wholesale_price: row[5],
                       market_price: row[6],
                       shelf_life: row[7]
                     })
    end

    p "END"
  end
end
