class Product < ApplicationRecord
  has_rich_text :content
  belongs_to :category
  belongs_to :contry
  before_save do |product|
    if product.content
      product.photo = /src="(.*)"/.match(product.content.to_s)[1]
      pp product.photo
    end
  end
end
