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
    # TODO: set user_stock quantity here

    @user_stocks = UserStock.where(stock_id: params[:stock_id], user_id: params[:user_id])
    if(@user_stocks.count == 0)
      # create if doesn't yet exist
      @user_stock = UserStock.new(user_stock_params)
      @user_stock.save
    else
      # update if already exists
      @user_stock = @user_stocks[0]
      # @user_stock.update(user_stock_params)
      # @user_stock.update(:quantity => params[:quantity])
      @user_stock.quantity = params[:quantity]
      @user_stock.save
    end

   
    # TODO: set user_stock quantity here

    # @user_stock = UserStock.find_or_initialize_by(stock_id: params[:stock_id]).update_attributes(:quantity => params[:quantity])

    @stock = Stock.where(id: params[:stock_id])
    # @user = User.where(id: params[:user_id])
    # @stock.users << @user
    current_user.stocks << @stock

    #create a transaction record
    Transaction.create(user_stock_params)
    
    # if @user_stock.save
        # redirect_to user_stocks_path
        # redirect_to stocks_path
        redirect_to "/users/#{current_user.id}"
    # else
    #     render :new
    # end

    
  end

  def record

  end

  def edit
    @user_stock = UserStock.find(params[:id])
  end

  def update
    @user_stocks = UserStock.find(params[:id])
        if @user_stocks.update(user_stock_params)
            # redirect_to @user_stock
            # redirect_to user_stocks_path
            # redirect_to stocks_path
            redirect_to "/users/#{current_user.id}"
        # else
            # render :edit
        end
  end

  def destroy
      @user_stock = UserStock.find(params[:id])
      @user_stock.destroy
      # redirect_to user_stocks_path
      redirect_to "/users/#{params[:user_id]}"
  end

  private
  def user_stock_params
      params.require(:user_stock).permit(:user_id, :stock_id, :quantity, :id)
  end

 
end
