class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :category_id }
  belongs_to :category
  has_many   :product_tags
  has_many   :products, through: :product_tags

end
