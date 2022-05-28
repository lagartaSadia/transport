class DeliveryTimesController < ApplicationController
    before_action :set_delivery_time, only: [:show, :edit, :update]

    before_action :authenticate_user!
    before_action :check_carrier

    def index
    end

    def new
        @delivery_time = DeliveryTime.new
    end

    def create
        @delivery_time = DeliveryTime.new(delivery_time_params)

        if @delivery_time.save
            redirect_to delivery_times_path, notice: 'Prazo de Entrega cadastrado com sucesso.'
        else
            flash.now[:notice] = 'Prazo de Entrega não cadastrado.'
            @carrier = Carrier.all
            render 'new'
        end
    end

    private

    def set_delivery_time
        @delivery_time = DeliveryTime.find(params[:id])
    end

    def delivery_time_params
        params.require(:delivery_time).permit(:first_distance, :second_distance, :time, :carrier_id)
    end

    def check_carrier
        user = current_user
        if user.admin?
            @carriers = Carrier.all
            @delivery_times = DeliveryTime.all
        else
            @carriers = Carrier.where('id = ?', user.carrier_id)
            @delivery_times = DeliveryTime.where('carrier_id = ?', user.carrier_id)
            if @carriers.empty?
                redirect_to root_path, notice: 'Não há transportador cadastrada para o seu usuário. Contate o administrador do sistema!'
            end
        end
    end
end