class Product < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search && search!=""
        where(["name ILIKE ?","%#{search}%"]).or where(["category ILIKE ?","%#{search}%"]).or where(["location ILIKE ?","%#{search}%"])
        #broken code >>> basic_search(category: "%#{search}%" ).basic_search(name: "%#{search}%")
    else
        all
    end

    
end
end
