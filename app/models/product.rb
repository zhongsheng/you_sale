class Product < ApplicationRecord
  default_scope { where(hidden: false) }
  # default_scope { where(published: true) }
  default_scope { order(:id) }
  has_rich_text :content
  belongs_to :category
  belongs_to :contry
  belongs_to :supplier
  has_many   :product_tags
  has_many   :tags, through: :product_tags

  before_save do |product|
    if not product.content.blank?
      if /src="(.*)"/.match(product.content.to_s)
        product.photo = $1
        pp product.photo
      end
    end
  end

  def destroy
    self.update({hidden: true})
  end
end
