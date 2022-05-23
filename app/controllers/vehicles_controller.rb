class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show]

    def index
        @carrier = Carrier.all
        @vehicles = Vehicle.all
    end

    def show
    end

    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end
end