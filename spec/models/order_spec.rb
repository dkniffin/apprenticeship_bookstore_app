require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { Order.new }

  it { is_expected.to respond_to(:completed) }
  it { is_expected.to respond_to(:line_items) }
  it { is_expected.to respond_to(:stripe_token) }

  describe "valid order" do
    subject(:order) { build(:order) }
  end
  describe "invalid line_item" do
  end

  describe "#total" do
    let(:book) { build(:one_dollar_book) }
    subject(:order) do
      order = build(:open_order)
      order.line_items << build(:line_item, book: book, quantity: 1)
      order.line_items << build(:line_item, book: book, quantity: 2)
      order
    end

    it "sums the line items" do
      expect(order.total).to eq(Money.new(300))
    end
  end
end
