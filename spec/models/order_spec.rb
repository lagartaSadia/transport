require 'rails_helper'

RSpec.describe Order, type: :model do
    describe 'Gera um código aleatório' do
        it 'ao criar um novo pedido' do
            user = User.create!(email:'jacques@sistemadefrete.com.br', password: 'password')

            carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

            order = Order.new(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 0.8, item_weight: 2, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier)

            order.save!
            result = order.code

            expect(result).not_to be_empty
            expect(result.length).to eq 15
        end

        it 'é único' do
            user = User.create!(email:'jacques@sistemadefrete.com.br', password: 'password')

            carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

            order = Order.create!(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 0.8, item_weight: 2, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier)

            second_order = Order.new(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 1.3, item_weight: 8, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier)

            second_order.save!
            result = second_order.code

            expect(result).not_to eq order.code
        end
    end
end
