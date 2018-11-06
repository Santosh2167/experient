class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :interests, as: :categorable

  has_one :business
  has_many :product_reviews
  has_many :transactions

  def name
   self.first_name + " " + self.last_name

  end

end
