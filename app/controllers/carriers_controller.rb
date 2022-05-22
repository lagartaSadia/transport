class CarriersController < ApplicationController
    before_action :set_carrier, only: [:edit, :update, :show]
    
    def index
        @carriers = Carrier.all
    end

    def new
        @carrier = Carrier.new
    end

    def create
        @carrier = Carrier.new(carrier_params)

        if @carrier.save
            redirect_to @carrier, notice: 'Transportadora cadastrada com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível cadastrar a transportadora.'
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @carrier.update(carrier_params)
            redirect_to @carrier, notice: 'Transportadora editada com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível editar a transportadora'
            render 'edit'
        end
    end

    private

    def set_carrier
        @carrier = Carrier.find(params[:id])
    end

    def carrier_params
        params.require(:carrier).permit(:corporate_name, :brand_name, :domain, :registered_number, :full_address)
    end
end