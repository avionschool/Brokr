class TransactionController < ApplicationController
    #User is only allowed to CREATE transaction
    #Admin is only allowed to CANCEL/DESTROY transaction
    #User and Admin can VIEW all transactions THROUGH INDEX

    def index
        @transaction = Transaction.all
    end
    
    def new
    end


    def create
        # 1. from current transaction:
        # find stock information
        @stock = Stock.find(params[:stock_id])

        # record the quantity bought by user
        @quantity = params[:quantity]

        # 2. calculate total price
        @total_price = @client.quote(@stock.symbol) * quantity

        # 3. record new transaction by recording: user_id, stock_id, quantity and total_price
        @transaction = Transaction.new(user_id: params[:user_id], stock_id: params[:stock_id], quantity: params[:quantity] total_price: @total_price)
        @transaction.save 
    end

    def edit
    end

    def update
    end

    def destroy
        #Used to cancel transactions
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
    end

    private
    def transaction_params
        params.require(:transaction).permit(:user_id, :stock_id, :quantity, :total_price)
    end
    
end
