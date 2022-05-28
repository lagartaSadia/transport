require 'rails_helper'

describe 'Usuário edita um veículo' do
    it 'e visualiza o formulário' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        Vehicle.create!(license_plate: 'DCC8524', brand: 'VW', vehicle_type: 'Utilitário', fabrication_date: 2012, capacity: 8000, carrier: carrier)

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Veículos'
        click_on 'DCC8524'
        click_on 'Editar'

        expect(page).to have_content 'Editar Veículo: DCC8524'
        expect(page).to have_field 'Marca', with: 'VW'
        expect(page).to have_field 'Tipo do Veículo', with: 'Utilitário'
        expect(page).to have_field 'Placa', with: 'DCC8524'
        expect(page).to have_field 'Ano de Fabricação', with: '2012'
        expect(page).to have_field 'Capacidade', with: '8000'
    end

    it 'com sucesso' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        Carrier.create!(corporate_name: 'Carreiro Logi', brand_name: 'Carreiro', domain: 'carreiro.com.br', registered_number: '35648745120015', full_address: 'Rua da Estrada, 145 - Juerê - SP')

        Vehicle.create!(license_plate: 'DCC8524', brand: 'VW', vehicle_type: 'Utilitário', fabrication_date: 2012, capacity: 8000, carrier: carrier)

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Veículos'
        click_on 'DCC8524'
        click_on 'Editar'

        fill_in 'Ano de Fabricação', with: 2010
        fill_in 'Marca', with: 'BMW'

        click_on 'Salvar'

        expect(page).to have_content 'Veículo atualizado com sucesso.'
        expect(page).to have_content 'Marca: BMW'
        expect(page).to have_content 'Ano de Fabricação: 2010'
    end
end