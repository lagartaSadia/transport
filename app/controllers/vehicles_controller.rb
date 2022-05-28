class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :edit, :update]

    before_action :authenticate_user!
    before_action :check_carrier

    def index
    end

    def show
    end

    def new
        @vehicle = Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

        if @vehicle.save
            redirect_to @vehicle, notice: 'Veículo cadastrado com sucesso.'
        else
            flash.now[:notice] = 'Veículo não cadastrado.'
            @carrier = Carrier.all
            render 'new'
        end
    end

    def edit
    end

    def update
        if @vehicle.update(vehicle_params)
            redirect_to @vehicle, notice: 'Veículo atualizado com sucesso.'
        else
            flash.now[:notice] = 'Não foi possível editar o veículo'
            @carrier = Carrier.all
            render 'edit'
        end
    end

    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:license_plate, :brand, :vehicle_type, :fabrication_date, :capacity, :carrier_id)
    end

    def check_carrier
        user = current_user
        if user.admin?
            @carriers = Carrier.all
            @vehicles = Vehicle.all
        else
            @carriers = Carrier.where('id = ?', user.carrier_id)
            @vehicles = Vehicle.where('carrier_id = ?', user.carrier_id)
            if @carriers.empty?
                redirect_to root_path, notice: 'Não há transportador cadastrada para o seu usuário. Contate o administrador do sistema!'
            end
        end
    end
end