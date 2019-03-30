class Category < ApplicationRecord
  validates :name, presence: true
  has_many :tags
  has_many :products
end
