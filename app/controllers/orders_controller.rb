class OrdersController < ApplicationController
    def new
        @order = Order.new
        @carriers = Carrier.all
    end
end