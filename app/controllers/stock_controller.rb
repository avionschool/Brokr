class StockController < ApplicationController

    def index

        client = IEX::Api::Client.new(
            publishable_token: 'pk_3fac9a23e6694fdcb684099ec25cf67b',
            secret_token: 'sk_9d27a9ab69c64168ad4fad54cf700ecb',
            endpoint: 'https://cloud.iexapis.com/v1'
          )

        @stocks = client.stock_market_list(:mostactive)
    end

    # def index
    #     @stock = client.all
    # end

end
