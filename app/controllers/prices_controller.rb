class PricesController < ApplicationController
    before_action :set_price, only: [:edit, :update]

    def index
        @carriers = Carrier.all
        @price = Price.all
    end

    def new
        @price = Price.new
    end

    def create
        @price = Price.new(price_params)

        if @price.save
            redirect_to prices_path, notice: 'Taxa cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Taxa não cadastrada.'
            @carrier = Carrier.all
            render 'new'
        end
    end

    private

    def set_price
        @price = Price.find(params[:id])
    end

    def price_params
        params.require(:price).permit(:first_dimension, :second_dimension, :first_weight, :second_weight, :fee, :minimal_fee, :carrier_id)
    end
end