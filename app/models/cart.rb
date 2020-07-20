class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates_presence_of :user_id

  def add_product(product_id, product_price, quantity = nil)
    # Check if product has already added in the cart
    current_item = line_items.find_by(product_id: product_id)

    return line_items.build(product_id: product_id, price: product_price, quantity: quantity ? quantity : 1) unless current_item

    # Use quantity if provided else just increment
    if quantity
      current_item.quantity = quantity
      current_item.price = product_price * quantity
    else
      current_item.quantity += 1
      current_item.price += product_price
    end

    current_item
  end
end
