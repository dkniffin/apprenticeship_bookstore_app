require 'rails_helper'

describe OrdersController, type: :controller do
  context "when not logged in" do
    describe "GET /orders" do
      before { get :index }
      it "redirects to login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    describe "GET /orders/:id" do
      let!(:order) { create(:order) }
      before { get :show, id: order.id }

      it "redirects to login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  context "when logged in" do
    login_user
    # index
    describe "GET /orders" do
      let!(:orders) { create_list(:order,3) }
      before { controller.current_user.orders << orders }

      before { get :index }

      it "renders the index page" do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
      it "responds with the orders for the current user" do
        expect(assigns(:orders)).to eq(orders)
      end
    end

    # show
    describe "GET /orders/:id" do
      context "with an order owned by the user" do
        let!(:order) { create(:order) }
        before { controller.current_user.orders << order }

        before { get :show, id: order.id }

        it "renders the show page" do
          expect(response).to have_http_status(:ok)
          expect(response).to render_template(:show)
        end
      end
      context "with an order not owned by the user" do
        let!(:order) { create(:order) }

        it "raises a RecordNotFound error" do
          expect{ get :show, id: order.id
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    # add_to_cart
    describe "POST /orders/add_to_cart" do
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
