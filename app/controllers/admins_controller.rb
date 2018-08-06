class AdminsController < ApplicationController
  before_action :admin?
  before_action :set_user, only: [:edit, :update]

  def panel
    @users = User.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to panel_admins_path, notice: 'User was successfully updated.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :admin)
  end
end
