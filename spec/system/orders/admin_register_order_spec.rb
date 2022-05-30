require 'rails_helper'

describe 'Usuário cadastra um pedido' do
    it 'com sucesso' do
        Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        user = User.create!(email:'admin@sistemadefrete.com.br', password: 'password')

        allow(SecureRandom).to receive(:alphanumeric).and_return('TRANSPOR9021PRO')

        login_as(user)
        visit root_path
        click_on 'Registrar Pedido'

        fill_in 'Endereço de Coleta', with: 'Rua Capitão Américo, 228 - Formiga - MG'
        fill_in 'Código de Coleta', with: 'PROD12'
        fill_in 'Dimensão do Produto', with: '0.800'
        fill_in 'Peso do Produto', with: '3'
        fill_in 'Endereço de Entrega', with: 'Rua Quarenta, 2 - Gonçalves - RG'
        fill_in 'Destinatário', with: 'Roberto Nascimento'
        select 'Logi Transportes', from: 'Transportadora'

        click_on 'Criar Ordem de Pedido'

        expect(page).to have_content 'Ordem criada com sucesso.'
        expect(page).to have_content 'Pedido TRANSPOR9021PRO'
    end
end