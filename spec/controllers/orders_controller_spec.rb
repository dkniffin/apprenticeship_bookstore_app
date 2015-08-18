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
  end
end
