class ConsultsController < ApplicationController
    
    def show
        @consult = Consult.find(params[:id])

        @prices = Price.joins(:carrier).where('first_dimension < ? AND second_dimension > ?', @consult.item_dimension, @consult.item_dimension).where("first_weight < ? AND second_weight > ?", @consult.item_weight, @consult.item_weight).where(carriers: {status: 'active'})

        @delivery_times = DeliveryTime.joins(:carrier).where("first_distance < ? AND second_distance > ?", @consult.distance, @consult.distance).where(carriers: {status: 'active'})

        array = @prices.zip(@delivery_times)            
    end

    def new
        @consult = Consult.new
    end

    def create
        @consult = Consult.new(consult_params)

        if @consult.save
            redirect_to @consult
        else
            flash.now[:notice] = 'Consulta não pode ser realizada.'
            render 'new'
        end
    end

    private

    def consult_params
        params.require(:consult).permit(:item_dimension, :item_weight, :distance)
    end
end