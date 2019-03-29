class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :category_id }
  belongs_to :category
end
