class Product < ActiveRecord::Base
   # default_scope { order: 'title' }
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, format: {with: %r{\.(png|gif|jpg)},
    message:"must be url for .jpg,.gif or .png"}

  def product_with_image
    [title, description].join" "
  end

  def self.check_price
    "class_method"
  end

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
  end
