require 'rails_helper'

describe 'Usuário visualiza a tela de prazos de entrega' do
    it 'a partir da tela inicial' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Prazos de Entrega'

        expect(page).to have_content 'Lista de Prazos de Entrega'
    end

    it 'e vê lista de prazos' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        DeliveryTime.create!(first_distance: 0, second_distance: 50, time: 2, carrier: carrier)
        DeliveryTime.create!(first_distance: 50, second_distance: 100, time: 5, carrier: carrier)

        visit root_path
        login_as(user)
        click_on 'Prazos de Entrega'

        expect(page).to have_content 'Prazos da Logi Transportes'
        expect(page).to have_content 'Distância'
        expect(page).to have_content 'Prazo de Entrega'
        expect(page).to have_content '0 até 50km'
        expect(page).to have_content '2 dias'
        expect(page).to have_content '50 até 100km'
        expect(page).to have_content '5 dias'
    end

    it 'e vê lista de prazos da usua transportadora apenas' do
        carrier = Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - RS')
        
        second_carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        DeliveryTime.create!(first_distance: 0, second_distance: 50, time: 2, carrier: carrier)
        DeliveryTime.create!(first_distance: 50, second_distance: 100, time: 5, carrier: carrier)


        DeliveryTime.create!(first_distance: 0, second_distance: 50, time: 1, carrier: second_carrier)
        DeliveryTime.create!(first_distance: 50, second_distance: 100, time: 3, carrier: second_carrier)

        visit root_path
        login_as(user)
        click_on 'Prazos de Entrega'

        expect(page).to have_content 'Prazos da Logi Transportes'
        expect(page).to have_content 'Distância'
        expect(page).to have_content 'Prazo de Entrega'
        expect(page).to have_content '0 até 50km'
        expect(page).to have_content '1 dias'
        expect(page).to have_content '50 até 100km'
        expect(page).to have_content '3 dias'

        expect(page).not_to have_content 'Prazos da Rodox Logistica'
    end
end