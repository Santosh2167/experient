class ProductReview < ApplicationRecord
  belongs_to :user
  belongs_to :trans, class_name: 'Transaction', foreign_key: 'transaction_id'
  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, :greater_than => 0, :less_than => 6 }, length: { is: 1 }
end
