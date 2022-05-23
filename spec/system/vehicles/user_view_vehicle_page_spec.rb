require 'rails_helper'

describe 'Usuário visita página de veículos' do
    it 'a partir da tela inicial' do
        visit root_path
        click_on 'Veículos'

        expect(page).to have_content 'Lista de Veículos'
    end

    it 'e vê lista de veículos cadastrados' do
        carrier = Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

        Vehicle.create!(license_plate: 'MEC9096', brand: 'Volvo', vehicle_type: 'Caminhão', fabrication_date: 1990, capacity: 20000, carrier: carrier)
        Vehicle.create!(license_plate: 'DCC8524', brand: 'VW', vehicle_type: 'Utilitário', fabrication_date: 2012, capacity: 8000, carrier: carrier)

        visit root_path
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

        visit root_path
        click_on 'Veículos'
        click_on 'Utilitário'

        expect(page).to have_content 'Veículo da Rodox Logistica'
        expect(page).to have_content 'Marca: VW'
        expect(page).to have_content 'Placa: DCC8524'
        expect(page).to have_content 'Tipo: Utilitário'
        expect(page).to have_content 'Ano de Fabricação: 2012'
        expect(page).to have_content 'Capacidade: 8000kg'
    end
end