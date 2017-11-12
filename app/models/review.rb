class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :description, presence: true, length: { minimum: 2 }
  validates :product_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true, numericality: { only_integer: true }
end
