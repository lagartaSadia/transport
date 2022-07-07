require 'rails_helper'

describe 'Usuário acessa a tela de transportadoras' do
    it 'com sucesso' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        login_as(user)
        visit root_path
        click_on 'Transportadoras'

        expect(current_path).to eq carriers_path
        expect(page).to have_content 'Transportadoras'
    end

    it 'e vê lista de transportadoras cadastradas' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')
        
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        login_as(user)
        visit root_path
        click_on 'Transportadoras'

        expect(page).to have_content 'Logi Transportes'
        expect(page).to have_content 'Endereço: Rua Maluca, 45 - Joaçaba - MG'
    end

    it 'e não há transportadoras cadastradas' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')
        
        login_as(user)
        visit root_path
        click_on 'Transportadoras'

        expect(page).to have_content 'Não há transportadoras cadastradas.'
    end
end