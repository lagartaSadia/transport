require 'rails_helper'

describe 'Usuário cadastra prazo de entrega' do
    it 'e vê formulário' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')
        
        visit root_path
        login_as(user)
        click_on 'Prazos de Entrega'
        click_on 'Cadastrar Prazo'

        expect(page).to have_content 'Cadastro de Prazo de Entrega'
        expect(page).to have_field 'Distância Inicial'
        expect(page).to have_field 'Distância Final'
        expect(page).to have_field 'Prazo de Entrega'
    end

    it 'com sucesso' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email: 'lucas@logi.com.br', password: 'password')
        
        visit root_path
        login_as(user)
        click_on 'Prazos de Entrega'
        click_on 'Cadastrar Prazo'

        fill_in 'Distância Inicial', with: '0'
        fill_in 'Distância Final', with: '50'
        fill_in 'Prazo de Entrega', with: '3'

        click_on 'Salvar'

        expect(current_path).to eq delivery_times_path
        expect(page).to have_content 'Prazo de Entrega cadastrado com sucesso.'
    end
end