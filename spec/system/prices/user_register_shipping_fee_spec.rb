require 'rails_helper'

describe 'Usuário registra uma taxa de entrega' do
    it 'e vê formulário' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Taxas de Frete'
        click_on 'Cadastrar Taxa'

        expect(page).to have_content 'Cadastro de Taxa de Frete'
        expect(page).to have_field 'Dimensão Inicial' 
        expect(page).to have_field 'Dimensão Final'
        expect(page).to have_field 'Peso Inicial'
        expect(page).to have_field 'Peso Final'
        expect(page).to have_field 'Valor por KM'
        expect(page).to have_field 'Taxa Mínima'
        expect(page).to have_button 'Salvar'
    end

    it 'com sucesso' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')

        visit root_path
        login_as(user)
        click_on 'Taxas de Frete'
        click_on 'Cadastrar Taxa'

        fill_in 'Dimensão Inicial',	with: "0.001" 
        fill_in 'Dimensão Final',	with: "0.500" 
        fill_in 'Peso Inicial',	with: "0" 
        fill_in 'Peso Final',	with: "10" 
        fill_in 'Valor por KM',	with: "0.50" 
        fill_in 'Taxa Mínima',	with: "15" 

        click_on 'Salvar'

        expect(current_path).to eq prices_path
        expect(page).to  have_content 'Taxa cadastrada com sucesso.'
    end
end
