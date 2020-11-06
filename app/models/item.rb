class Item < ApplicationRecord
  has_one_attached :image
  has_many :orders, dependent: :destroy
  belongs_to :user
  has_rich_text :content

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tag

  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :title
    validates :sub_title
    validates :target_amount
    validates :day_id
    with_options numericality: { other_than: 0 } do
      validates :tag_id
    end
  end
end
