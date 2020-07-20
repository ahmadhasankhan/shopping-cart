require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'associations' do
    it { should belong_to(:cart) }
  end

  describe 'validations' do
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:price) }
  end

  describe 'creation' do
    let(:cart) { Cart.create(user_id: 1) }

    it 'creates and persists a line item' do
      LineItem.create!(cart_id: cart.id, product_id: 1, price: 100)
      line_item = LineItem.find_by(product_id: 1)

      expect(line_item).to be_present
      expect(line_item.price).to eq(100)
      expect(line_item.quantity).to eq(1)
    end
  end
end
