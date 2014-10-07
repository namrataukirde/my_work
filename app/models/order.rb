class Order < ActiveRecord::Base
  has_many :line_items
  PAYMENT_TYPES = ["check","purchase order","credit card"]
  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  scope :by_type,  -> (type) { where(pay_type: type) }

  def self.check_abc
    where(pay_type: 'check')
  end

  def self.match_by_type
    where(pay_type: 'check')
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
