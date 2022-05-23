require 'rails_helper'

describe 'Usuário registra novo veículo' do
    it 'e visualiza o formulário' do
        visit root_path
        click_on 'Veículos'
        click_on 'Cadastrar Veículo'

        expect(page).to have_content 'Cadastro de Veículo'
        expect(page).to have_field 'Marca'
        expect(page).to have_field 'Tipo do Veículo'
        expect(page).to have_field 'Placa'
        expect(page).to have_field 'Ano de Fabricação'
        expect(page).to have_field 'Capacidade'
        expect(page).to have_field 'Transportadora'
    end

    it 'com sucesso' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        visit root_path
        click_on 'Veículos'
        click_on 'Cadastrar Veículo'

        fill_in 'Marca', with: 'Ford'
        fill_in 'Tipo do Veículo', with: 'Caminhão'
        fill_in 'Placa', with: 'BCA9080'
        fill_in 'Ano de Fabricação', with: '2010'
        fill_in 'Capacidade', with: '12000'
        select 'Logi Transportes', from: 'Transportadora'

        click_on 'Salvar'

        expect(page).to have_content "Veículo da Logi Transportes"
        expect(page).to have_content 'Marca: Ford'
        expect(page).to have_content 'Placa: BCA9080'
        expect(page).to have_content 'Tipo: Caminhão'
        expect(page).to have_content 'Ano de Fabricação: 2010'
        expect(page).to have_content 'Capacidade: 12000kg'
    end
end