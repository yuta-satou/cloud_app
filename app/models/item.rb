class Item < ApplicationRecord
  has_one_attached :image
  has_many :order
  has_rich_text :content

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day
  belongs_to_active_hash :tag

end
