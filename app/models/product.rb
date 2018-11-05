class Product < ApplicationRecord
  belongs_to :user

  belongs_to :age_group
  belongs_to :category
  has_many :product_reviews
  has_many :transactions
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search && search!=""
        where(["name ILIKE ?","%#{search}%"]).or where(["category ILIKE ?","%#{search}%"]).or where(["location ILIKE ?","%#{search}%"]).or where(["keywords ILIKE ?","%#{search}%"])
        #broken code >>> basic_search(category: "%#{search}%" ).basic_search(name: "%#{search}%")
    else
        all
    end

    
end
end
