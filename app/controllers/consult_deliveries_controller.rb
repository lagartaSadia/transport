class ConsultDeliveriesController < ApplicationController
    def show
        @consult = ConsultDelivery.find(params[:id])

        @carriers = Carrier.all
    end
    
    def new
        @consult = ConsultDelivery.new
    end

    private

    def delivery_fee
        @carriers = Carrier.all

        @carrier.each do |carrier|
            if carrier.status == 'active'
                carrier.delivery_times.time
            end
        end
    end
end