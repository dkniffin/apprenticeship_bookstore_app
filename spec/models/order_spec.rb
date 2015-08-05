require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { Order.new }

  it { is_expected.to respond_to(:completed) }
  it { is_expected.to respond_to(:line_items) }

  describe "valid order" do
    subject(:order) { build(:order) }

    it "has a completed flag" do
      expect(order.completed).to satisfy {|c| c == true || c == false }
    end
  end
  describe "invalid line_item" do
    subject(:no_completed) { build(:order, completed: nil) }

    it "is invalid without completed" do
      expect(no_completed).to_not be_valid
      expect(no_completed.errors).to include(:completed)
      expect(no_completed.errors[:completed]).to include("can't be blank")
    end
  end
end
