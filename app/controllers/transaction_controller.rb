class TransactionController < ApplicationController
    #User is only allowed to CREATE transaction
    #Admin is only allowed to CANCEL/DESTROY transaction
    #User and Admin can VIEW all transactions THROUGH INDEX

    def index
        @transaction = Transaction.all
    end
    
    def new
    end

    def show 
        @transaction = Transaction.where(user_id: params[:user_id])
    end

    def create
        @transaction = Transaction.new(user_id: params[:user_id], stock_id: params[:stock_id], quantity: params[:quantity],purchase_price: params[:purchase_price])
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
        params.require(:transaction).permit(:user_id, :stock_id, :quantity, :total_price, :purchase_price)
    end
    
end
