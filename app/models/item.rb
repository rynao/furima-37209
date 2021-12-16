class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true

  NUMBER_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: NUMBER_REGEX

  validates :price, numericality: { greater_than: 299, less_than: 10000000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_date

  belongs_to :user
  has_one_attached :image

end
