class Business < ApplicationRecord
 belongs_to :user
 validates :trading_name, :registered_business_name, :business_address, :post_code, :abn, :phone_number, presence: true
end
