require 'rails_helper'

describe BooksController, type: :controller do
  context "when not logged in" do
    describe "GET /books" do
      before { get :index }
      it "redirects to login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    describe "GET /books/:id" do
      let!(:book) { create(:book) }
      before { get :show, id: book.id }

      it "redirects to login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  context "when logged in" do
    login_user

    describe "GET /books" do
      let!(:books) { create_list(:book, 3) }
      before { get :index }

      it "renders the index page" do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end
    describe "GET /books/:id" do
      let(:book) { create(:book) }
      before { get :show, id: book.id }

      it "renders the show page" do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
      end
    end
  end
end
