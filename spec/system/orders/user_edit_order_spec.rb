require 'rails_helper'

describe 'Usuário edita uma ordem de pedito' do
    it 'e vê lista de ordens de pedidos' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        order = Order.new(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 0.8, item_weight: 2, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier)

        user = User.create!(email:'lucas@logi.com.br', password: 'password')

        allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('TRANSPOR9021PRO')

        order.save!

        login_as(user)
        visit root_path
        click_on 'Meus Pedidos'

        expect(page).to have_content 'Pedido TRANSPOR9021PRO'
        expect(page).to have_content 'Status: Pendente de Aceite'
    end

    it 'e aceita o pedido' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        order = Order.new(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 0.8, item_weight: 2, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier)

        vehicle = Vehicle.create!(license_plate: 'MEC9096', brand: 'Volvo', vehicle_type: 'Caminhão', fabrication_date: 1990, capacity: 20000, carrier: carrier)

        user = User.create!(email:'lucas@logi.com.br', password: 'password')

        allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('TRANSPOR9021PRO')

        order.save!

        login_as(user)
        visit root_path
        click_on 'Meus Pedidos'
        click_on 'TRANSPOR9021PRO'
        
        select 'Accepted', from: 'Status'
        select 'MEC9096', from: 'Veículo'

        click_on 'Atualizar'

        result = order.vehicle_id

        expect(page).to have_content 'Status: Aceito'
        expect(result).to eq vehicle.id
    end
end