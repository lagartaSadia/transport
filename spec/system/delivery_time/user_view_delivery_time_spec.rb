require 'rails_helper'

describe 'Usuário visualiza a tela de prazos de entrega' do
    it 'a partir da tela inicial' do
        visit root_path
        click_on 'Prazos de Entrega'

        expect(page).to have_content 'Lista de Prazos de Entrega'
    end

    it 'e vê lista de prazos' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        DeliveryTime.create!(first_distance: 0, second_distance: 50, time: 2, carrier: carrier)
        DeliveryTime.create!(first_distance: 50, second_distance: 100, time: 5, carrier: carrier)

        visit root_path
        click_on 'Prazos de Entrega'

        expect(page).to have_content 'Prazos da Logi Transportes'
        expect(page).to have_content 'Distância'
        expect(page).to have_content 'Prazo de Entrega'
        expect(page).to have_content '0 até 50km'
        expect(page).to have_content '2 dias'
        expect(page).to have_content '50 até 100km'
        expect(page).to have_content '5 dias'
    end
end