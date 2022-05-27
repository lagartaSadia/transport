require 'rails_helper'

describe 'Usuário acessa a tela de transportadoras' do
    it 'se estiver autenticado como admin' do
        visit root_path
        click_on 'Transportadoras'

        expect(current_path).not_to be carriers_path
        expect(page).to have_content 'Para continuar, faça login ou registre-se.'
    end

    it 'com sucesso' do
        visit root_path
        click_on 'Transportadoras'

        expect(current_path).to eq carriers_path
        expect(page).to have_content 'Transportadoras'
    end

    it 'e vê lista de transportadoras cadastradas' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        visit root_path
        click_on 'Transportadoras'

        expect(page).to have_content 'Logi Transportes'
        expect(page).to have_content 'Endereço: Rua Maluca, 45 - Joaçaba - MG'
    end

    it 'e não há transportadoras cadastradas' do
        visit root_path
        click_on 'Transportadoras'

        expect(page).to have_content 'Não há transportadoras cadastradas.'
    end
end