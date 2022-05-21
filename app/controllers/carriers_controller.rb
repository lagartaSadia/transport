class CarriersController < ApplicationController
    def index
        @carriers = Carrier.all
    end
end