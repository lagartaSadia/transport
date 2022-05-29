require 'rails_helper'

describe 'Usuário faz login no sistema' do
    it 'como administrador' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: '1231231')

        visit root_path
        click_on 'Login'

        fill_in 'E-mail', with: 'lucas@sistemadefrete.com.br'
        fill_in 'Senha', with: '1231231'
        click_on 'Log in'

        expect(page).to have_content 'Login efetuado com sucesso.'
        expect(user.admin?).to be true
    end

    it 'como usuário' do
        user = User.create!(email: 'lucas@transportes.com.br', password: '1231231')

        visit root_path
        click_on 'Login'

        fill_in 'E-mail', with: 'lucas@transportes.com.br'
        fill_in 'Senha', with: '1231231'
        click_on 'Log in'

        expect(page).to have_content 'Login efetuado com sucesso.'
        expect(user.user?).to be true
    end
    
    it 'e vincula a uma transportadora' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')
        id = carrier.id

        user = User.create!(email: 'lucas@logi.com.br', password: '1231231')

        visit root_path
        click_on 'Login'

        fill_in 'E-mail', with: 'lucas@logi.com.br'
        fill_in 'Senha', with: '1231231'
        click_on 'Log in'

        expect(user.carrier_id).to be id
    end

    it 'com dados inválidos' do
        user = User.create!(email: 'lucas@transportes.com.br', password: '1231231')

        visit root_path
        click_on 'Login'

        fill_in 'E-mail', with: 'lucas@transportes.com.br'
        fill_in 'Senha', with: ''
        click_on 'Log in'

        expect(page).to have_content 'E-mail ou senha inválidos.'
    end

    it 'e faz loggout' do
        user = User.create!(email: 'lucas@transportes.com.br', password: '1231231')

        visit root_path
        click_on 'Login'

        fill_in 'E-mail', with: 'lucas@transportes.com.br'
        fill_in 'Senha', with: '1231231'
        click_on 'Log in'

        click_on 'Sair'

        expect(page).to have_content 'Logout efetuado com sucesso.'
    end
end
