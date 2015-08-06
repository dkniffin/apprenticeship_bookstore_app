require 'rails_helper'

RSpec.describe LineItem, type: :model do
  subject(:line_item) { LineItem.new }

  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to respond_to(:book) }
  it { is_expected.to respond_to(:order) }

  describe "valid line_item" do
    subject(:line_item) { build(:line_item) }

    it "has a quantity" do
      expect(line_item.quantity).to be_a(Integer)
    end
    it "has a book" do
      expect(line_item.book).to be_a(Book)
    end
  end
  describe "invalid line_item" do
    subject(:no_quantity) { build(:line_item, quantity: nil) }
    subject(:no_book) { build(:line_item, book: nil) }

    it "is invalid without a quantity" do
      expect(no_quantity).to_not be_valid
      expect(no_quantity.errors).to include(:quantity)
      expect(no_quantity.errors[:quantity]).to include("can't be blank")
    end
    it "is invalid without a book" do
      expect(no_book).to_not be_valid
      expect(no_book.errors).to include(:book)
      expect(no_book.errors[:book]).to include("can't be blank")
    end
  end

  describe "#price" do
    let(:book) { build(:one_dollar_book) }
    subject(:line_item) { build(:line_item, book: book, quantity: 2) }
    it "equals the book's price * quantity" do
      expect(line_item.price).to eq(Money.new(200))
    end
  end
end
