class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :price
    validates :description
    validates :image
  end

  validates :price, numericality: { message: "is invalid. Input half-width characters" }
  validates :price, numericality: { greater_than: 299, less_than: 10000000, message: "is out of setting range" }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :ship_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_date

  belongs_to :user
  has_one_attached :image

end
