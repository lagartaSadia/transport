class PricesController < ApplicationController
    before_action :set_price, only: [:edit, :update]

    before_action :authenticate_user!
    before_action :check_carrier, only: [:index]

    def index
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

    def check_carrier
        user = current_user
        if user.admin?
            @carriers = Carrier.all
            @price = Price.all
        else
            @carriers = Carrier.where('id = ?', user.carrier_id)
            @price = Price.where('carrier_id = ?', user.carrier_id)
            if @carriers.empty?
                redirect_to root_path, notice: 'Não há transportador cadastrada para o seu usuário. Contate o administrador do sistema!'
            end
        end
    end
end