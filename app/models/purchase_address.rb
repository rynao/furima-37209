class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building, :telephone, :purchase_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address_line
    validates :telephone
    validates :purchase_id
    # validates :token, message: "is invalid.Credit card data can't be blank"

  end

  POST_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  TELEPHONE_REGEX = /\A\d{10,11}\z/.freeze
  validates :postal_code, format: { with: POST_CODE_REGEX, message: "is invalid. Include hyphen(-)" }
  validates :telephone, numericality: { with: TELEPHONE_REGEX, message: "is invalid. Input only number" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

end