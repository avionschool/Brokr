class UserStocksController < ApplicationController
  def index
    @user_stocks = UserStock.all
  end

  def show
    @user_stock = UserStock.find(params[:id])
  end

  def new
   
  end

  def create
    # @user_stock = UserStock.new(user_stock_params)
    @user_stock = UserStock.find_by(stock_id: params[:stock_id], user_id: params[:user_id])
    if(@user_stock.blank?)
      # create if doesn't yet exist
      @user_stock = UserStock.new(user_stock_params)

      @stock = Stock.where(id: params[:stock_id])
      # @user = User.where(id: params[:user_id])
      
      # this @stock.users << @user part has errors
      # @stock.users << @user
      current_user.stocks << @stock

      # note: this else part doesn't work
      # else
      #   @user_stock.update({:quantity => params[:quantity]})
      @user_stock.save
    end

    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @user_stock = UserStock.find(params[:id])
  end

  def update
<<<<<<< HEAD
    @user_stocks = UserStock.find(params[:id])
        if @user_stocks.update(user_stock_params)
            redirect_to "/users/#{current_user.id}"
        end
=======
    @user_stock = UserStock.find(params[:id])
    @user_stock.update(user_stock_params)
    
    redirect_to "/users/#{current_user.id}"
>>>>>>> 77af13af4fcef99c63528d9507b621de0a54fca7
  end

  def destroy
      @user_stock = UserStock.find(params[:id])
      @user_stock.destroy
<<<<<<< HEAD
      redirect_to "/users/#{params[:user_id]}"
=======
      # redirect_to user_stocks_path
      # redirect_to "/users/#{params[:user_id]}"
      redirect_to "/users/#{current_user.id}"
>>>>>>> 77af13af4fcef99c63528d9507b621de0a54fca7
  end

  private
  def user_stock_params
      params.require(:user_stock).permit(:user_id, :stock_id, :quantity, :id, :purchase_price)
  end

 
end
