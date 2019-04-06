class Import < ApplicationRecord
  has_one_attached :csv_file

  def self.parse_csv(file)
    require 'csv'
    first_row = nil
    log_num = 0
    CSV.foreach(file) do |row|
      if first_row == nil
        first_row = row
        next
      end
      row[2].gsub!("\n", ' ')
      row[2].gsub!("\s+", ' ')

      result = Product.create({
                    name: row[2],
                    contry_id: row[1],
                    category_id: row[0],
                    weight: row[4],
                    specification: row[5],
                    wholesale_price: row[6],
                    market_price: row[7],
                    shelf_life: row[8],
                    supplier_id: row[9]
                  })
      if result.errors.any?
        pp result.errors
        exit
      end

      log_num += 1

      tags = row[3].split
      tags.each do |t|
        tag = Tag.find_or_create_by!({name: t, category_id: row[0]})
        ProductTag.create({product_id: result.id, tag_id: tag.id})
      end

    end
    return log_num

  end
end
