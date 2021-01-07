class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.role_id === 1
      approved
    else
    end
  end

  private

  def approved
    @user = User.find(params[:id])
    @user.update_attribute(:status_approved, true)
    redirect_to users_path
  end

 
end
