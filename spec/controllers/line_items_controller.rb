require 'rails_helper'

describe LineItemsController, type: :controller do
  context "when logged in" do
    login_user
    
    # add_to_cart
    describe "POST /line_items/add_to_cart" do
      let(:book) { create(:book)}
      let(:line_item) { attributes_for(:line_item, book_id: book.id) }
      let(:current_order) { controller.current_user.orders.last }

      context "when there's not an open order" do
        it "creates a new order" do
          expect{ post :add_to_cart, line_item: line_item
          }.to change { controller.current_user.orders.length }.by(1)
        end
        it "puts the line item in that new order" do
          post :add_to_cart, line_item: line_item
          expect(current_order.line_items.last.book_id).to eq(line_item[:book_id])
          expect(current_order.line_items.last.quantity).to eq(line_item[:quantity])
        end
      end

      context "when there's already an open order" do
        before { controller.current_user.orders << build(:open_order) }

        it "doesn't create a new order" do
          expect{ post :add_to_cart, line_item: line_item
          }.to_not change { controller.current_user.orders.length }
        end

        it "adds the line item into that order" do
          post :add_to_cart, line_item: line_item
          expect(current_order.line_items.last.book_id).to eq(line_item[:book_id])
          expect(current_order.line_items.last.quantity).to eq(line_item[:quantity])
        end
      end
    end
  end
end
