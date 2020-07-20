require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { should have_many(:line_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
  end

  describe 'creation' do
    it 'creates and persists a shopping cart' do
      cart = Cart.create(user_id: 1)

      expect(cart).to be_valid
      expect(Cart.where(user_id: 1)).to exist
    end
  end

  describe 'Add Product' do
    let(:cart) { Cart.create(user_id: 1) }
    let(:price) { 100 }

    it 'initializes a new line item' do
      line_item = cart.add_product(1, price)
      expect(line_item.id).to be_nil
      expect(line_item.product_id).to eq(1)
      expect(line_item.price).to eq(100)
    end

    it 'adds a new item' do
      LineItem.create!(cart_id: cart.id, product_id: 1, price: price)

      cart.add_product(1, price)
      expect(LineItem.where(product_id: 1)).to exist
    end

    context 'when quantity is provided' do
      it 'auto increase the quantity' do
        line_item = cart.add_product(2, price)

        expect(line_item.quantity).to eq(1)
        expect(line_item.price).to eq(price)
      end
    end

    context 'when quantity is not provided' do
      it 'sets the given quantity' do
        given_quantity = 10
        LineItem.create!(cart_id: cart.id, product_id: 1, price: price)

        line_item = cart.add_product(1, price, given_quantity)
        expect(line_item.quantity).to eq(given_quantity)
        expect(line_item.price).to eq(given_quantity * price)
      end
    end
  end
end
