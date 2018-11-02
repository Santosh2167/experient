class Product < ApplicationRecord
  belongs_to :user
  has_many :product_reviews
  has_many :transactions

  def self.search(search)
    if search && search!=""
        where(["name ILIKE ?","%#{search}%"]).or where(["category ILIKE ?","%#{search}%"]).or where(["location ILIKE ?","%#{search}%"]).or where(["keywords ILIKE ?","%#{search}%"])
        #broken code >>> basic_search(category: "%#{search}%" ).basic_search(name: "%#{search}%")
    else
        all
    end

    
end
end
