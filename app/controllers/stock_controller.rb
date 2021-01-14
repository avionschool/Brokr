class StockController < ApplicationController

    def index
        @client = IEX::Api::Client.new(
            publishable_token: 'pk_3fac9a23e6694fdcb684099ec25cf67b',
            secret_token: 'sk_9d27a9ab69c64168ad4fad54cf700ecb',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        # @stocks = @client.ref_data_symbols().slice(0, 10)
        
        # TODO: improve
        if(Stock.all.length == 0) # if the db is empty, then populate it
            # get top 10 stock companies
            @stocks_from_api = @client.stock_market_list(:mostactive).slice(0, 10)
            @stocks_from_api.each do |stock_from_api|

                # create-only version:
                # stock = Stock.new
                # stock.symbol = stock_from_api.symbol

                # update if exists, create if doesn't exist
                # TODO: improve
                stock = Stock.find_or_initialize_by(:symbol => stock_from_api.symbol) do |s|
                    s.symbol = stock_from_api.symbol
                end

                stock.save
            end
        end 

        @stocks = Stock.all.slice(0, 10)
    end

    def show
        @stock = Stock.find(params[:id])
    end

    def new
        @stock = Stock.new  
    end

    def create
        @stock = Stock.new(stock_params)
        if @stock.save
            redirect_to stocks_path
        else
            render :new
        end
    end

    def edit
        @stock = Stock.find(params[:id])
    end

    def update
        @stock = Stock.find(params[:id])
        if @stock.update(stock_params)
            # redirect_to @stock
            redirect_to stocks_path
        else
            render :edit
        end
    end
    
    def destroy
        @stock = Stock.find(params[:id])
        @stock.destroy
        redirect_to stocks_path
    end

    private
    def stock_params
        params.require(:stock).permit(:symbol)
    end

end
