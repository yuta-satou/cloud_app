class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  attr_accessor :token, :price_id


  PRICE_REGEX = /\A[0-9]+\z/
  validates :token, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 },format: { with: PRICE_REGEX }

end
