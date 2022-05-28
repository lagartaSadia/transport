require 'rails_helper'

describe 'Usuário visita página de veículos' do
    it 'a partir da tela inicial' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Veículos'

        expect(page).to have_content 'Lista de Veículos'
    end

    it 'e vê lista de veículos cadastrados' do
        carrier = Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

        Vehicle.create!(license_plate: 'MEC9096', brand: 'Volvo', vehicle_type: 'Caminhão', fabrication_date: 1990, capacity: 20000, carrier: carrier)
        Vehicle.create!(license_plate: 'DCC8524', brand: 'VW', vehicle_type: 'Utilitário', fabrication_date: 2012, capacity: 8000, carrier: carrier)

        user = User.create!(email: 'lucas@rodox.com', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Veículos'

        expect(page).to have_content 'Veículos da Rodox Logistica'
        expect(page).to have_content 'Caminhão'
        expect(page).to have_content 'Placa: MEC9096'

        expect(page).to have_content 'Utilitário'
        expect(page).to have_content 'Placa: DCC8524'
    end

    it 'e vê detalhes do veículo' do
        carrier = Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

        Vehicle.create!(license_plate: 'MEC9096', brand: 'Volvo', vehicle_type: 'Caminhão', fabrication_date: 1990, capacity: 20000, carrier: carrier)
        Vehicle.create!(license_plate: 'DCC8524', brand: 'VW', vehicle_type: 'Utilitário', fabrication_date: 2012, capacity: 8000, carrier: carrier)

        user = User.create!(email: 'lucas@rodox.com', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Veículos'
        click_on 'DCC8524'

        expect(page).to have_content 'Veículo da Rodox Logistica'
        expect(page).to have_content 'Marca: VW'
        expect(page).to have_content 'Placa: DCC8524'
        expect(page).to have_content 'Tipo: Utilitário'
        expect(page).to have_content 'Ano de Fabricação: 2012'
        expect(page).to have_content 'Capacidade: 8000kg'
    end
end