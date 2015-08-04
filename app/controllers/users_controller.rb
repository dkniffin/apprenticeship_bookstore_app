class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update]
  # GET /users
  def index
    @users = User.all
  end

  # GET /user/:id/edit
  def edit
    render 'devise/registrations/edit', locals: {
      resource: @user,
      resource_name: @user
    }
  end

  # NOTE: All the other User interactions are handled by devise

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :admin, :password)
    end
end
