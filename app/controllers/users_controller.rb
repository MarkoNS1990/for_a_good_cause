class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at ASC')
  end

  def home; end

  def show
    @user = User.find(params[:id])
    @charities = @user.charities
  end
end
