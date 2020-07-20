class LineItem < ApplicationRecord
  belongs_to :cart
  before_create :calculate_price
  validates_presence_of :product_id, :cart_id, :price

  private

  def calculate_price
    self.price *= quantity
  end
end
