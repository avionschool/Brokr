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
<<<<<<< HEAD
    # if current_user.role_id === 1
    #   approved
    # else
    # end
    @user = User.find(params[:id])
    @user.update_attribute(:status_approved, true)
    UserNotifierMailer.broker_confirmed_email(@user).deliver_now
    redirect_to users_path


=======
  (current_user.role_id === 2) ? pending : approved
>>>>>>> 2e6d5c7a749298f505bb6c8511a397b70797ca09
  end

  private

  def approved
    @user = User.find(params[:id])
    @user.update_attribute(:status_approved, true)
    redirect_to users_path
  end

 
end
