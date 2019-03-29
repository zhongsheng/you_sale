class Supplier < ApplicationRecord
  validates :company, presence: true
  validates :company, uniqueness: true
end
