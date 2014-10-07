class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
      #it takes the items quantity frm line_items and search  it in line_items table by product_id
      # if found then it performs +1 otherwise builds
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end

  def remove_product(item)
    if item.quantity > 1
      item.quantity -= 1
      item.save
      item #returns the current item if a quantity remains
    else
      item.destroy
      false #returns false if no items are left
    end
  end
end
#in line_items_controller if we @line_items.save iis invoked then quantity gets updated in the db
