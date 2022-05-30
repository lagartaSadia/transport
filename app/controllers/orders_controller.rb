class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
    
    def index
        # mostra pedidos correspondente ao CARRIER_ID do USER
    end

    def show
        # Pode mostrar as atualizações do pedido WHERE CODE ORDER is 'codígo que o usuário digitar'
    end

    def new
        @order = Order.new
        @carriers = Carrier.all
    end

    def update
        # em vez de UPDATE irá SAVE no banco de dados para permitir que o visitante veja a atualização dos pedidos
    end

    private

    def order_params
        params.require(:order).permit(:vendor_address, :item_code, :item_dimension, :item_weight, :client_address, :client_information, :carrier_id)
    end

    def check_admin
        user = current_user
        if current_user.user?
            redirect_to root_path, alert: 'Você não tem permissão para acessar essa página.'
        end
    end
end