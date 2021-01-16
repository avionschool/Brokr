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

    #create a transaction record
    Transaction.create(user_stock_params)

    redirect_to "/users/#{current_user.id}"

  end

  def record

  end

  def edit
    @user_stock = UserStock.find(params[:id])
  end

  def update
    @user_stock = UserStock.find(params[:id])
    if @user_stock.update(user_stock_params)
        redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
      @user_stock = UserStock.find(params[:id])
      @user_stock.destroy
      redirect_to "/users/#{params[:user_id]}"
  end

  private
  def user_stock_params
      params.require(:user_stock).permit(:user_id, :stock_id, :quantity, :id, :purchase_price)
  end

 
end
