class PricesController < ApplicationController
    def index
        @carrier = Carrier.all
        @price = Price.all
    end
end