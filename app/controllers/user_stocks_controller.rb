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
    # TODO: set user_stock quantity here

    @user_stocks = UserStock.where(stock_id: params[:stock_id], user_id: params[:user_id])
    if(@user_stocks.count == 0)
      # create if doesn't yet exist
      @user_stock = UserStock.new(user_stock_params)
      @user_stock.save
    else
      # update if already exists
      @user_stock = @user_stocks[0]
      @user_stock.quantity = params[:quantity]
      @user_stock.save
    end

   
    # TODO: set user_stock quantity here
    @stock = Stock.where(id: params[:stock_id])
    current_user.stocks << @stock

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
    @user_stocks = UserStock.find(params[:id])
        if @user_stocks.update(user_stock_params)
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
