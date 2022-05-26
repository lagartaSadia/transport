class DeliveryTimesController < ApplicationController
    before_action :set_delivery_time, only: [:show, :edit, :update]

    def index
        @carriers = Carrier.all
        @delivery_times = DeliveryTime.all
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
end