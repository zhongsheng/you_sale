class ProductTag < ApplicationRecord
  validates  :product_id, uniqueness: { scope: :tag_id }
  belongs_to :product
  belongs_to :tag
end
