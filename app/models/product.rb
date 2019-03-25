class Product < ApplicationRecord
  has_rich_text :content
  belongs_to :category
  belongs_to :contry
end
