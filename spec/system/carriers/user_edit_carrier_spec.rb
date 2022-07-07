require 'rails_helper'

describe 'Usuário edita uma transportadora' do
    it 'e vê formulário preenchido com os dados da transportadora correta' do
        admin = User.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

        Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

        login_as(admin)
        visit root_path
        click_on 'Transportadoras'
        click_on 'Rodox Logistica'
        click_on 'Editar'

        expect(page).to have_content 'Editar Rodox Logistica'
        expect(page).to have_field 'Razão Social', with: 'Rodox Logistica' 
        expect(page).to have_field 'Nome Fantasia', with: 'Rodolog' 
        expect(page).to have_field 'Domínio de E-mail', with: 'rodox.com' 
        expect(page).to have_field 'CNPJ', with: '60150785000100' 
        expect(page).to have_field 'Endereço Completo', with: 'Estrada de Baixo, 99 - Joinville - SC' 
    end

    it 'e vê formulário preenchido com os dados da transportadora correta' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - RS')

        visit root_path
        login_as(user)
        click_on 'Transportadoras'
        click_on 'Rodox Logistica'
        click_on 'Editar'

        fill_in 'Nome Fantasia', with: 'Rodoxlog'
        fill_in 'Endereço Completo', with: 'Estrada de Cima, 100 - Joinville - SC'
        click_on 'Salvar'

        expect(page).to have_content 'Transportadora editada com sucesso.'
        expect(page).to have_content 'Nome Fantasia: Rodoxlog'
        expect(page).to have_content 'Endereço Completo: Estrada de Cima, 100 - Joinville - SC'
    end

    it 'e desativa a transportadora' do
        user = User.create!(email: 'lucas@sistemadefrete.com.br', password: 'password')

        Carrier.create!(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

        visit root_path
        login_as(user)
        click_on 'Transportadoras'
        click_on 'Rodox Logistica'
        click_on 'Editar'
        select 'Inactive', from: 'carrier_status'

        click_on 'Salvar'

        expect(page).to have_content 'Status: inactive'
    end
end