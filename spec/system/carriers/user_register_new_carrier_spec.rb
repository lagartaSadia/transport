require 'rails_helper'

describe 'Usuário registra uma nova transportadora' do
    it 'a partir da tela de transportadoras' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        login_as(user)
        visit root_path
        click_on 'Transportadoras'
        click_on 'Cadastrar Transportadora'

        expect(page).to have_content 'Cadastro de Transportadora'
        expect(page).to have_field 'Razão Social'
        expect(page).to have_field 'Nome Fantasia'
        expect(page).to have_field 'Domínio de E-mail'
        expect(page).to have_field 'CNPJ'
        expect(page).to have_field 'Endereço Completo'
        expect(page).to have_button 'Salvar'
    end

    it 'com sucesso' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        login_as(user)
        visit root_path
        click_on 'Transportadoras'
        click_on 'Cadastrar Transportadora'

        fill_in 'Razão Social',	with: 'Azul Transportes' 
        fill_in 'Nome Fantasia', with: 'Azul Rápido' 
        fill_in 'Domínio de E-mail', with: 'azul.com.br' 
        fill_in 'CNPJ',	with: '31285361000155' 
        fill_in 'Endereço Completo', with: 'Rua sem Esquina, 402 - Maringá - PR'

        click_on 'Salvar'

        expect(page).to have_content 'Razão Social: Azul Transportes'
        expect(page).to have_content 'Nome Fantasia: Azul Rápido'
        expect(page).to have_content 'Domínio de E-mail: azul.com.br'
        expect(page).to have_content 'CNPJ: 31285361000155'
        expect(page).to have_content 'Endereço Completo: Rua sem Esquina, 402 - Maringá - PR'
    end
end
