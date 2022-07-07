require 'rails_helper'

describe 'Visitante acessa a tela inicial' do
    it 'e vê o nome da aplicação' do
        visit root_path

        expect(page).to have_content 'Sistema de Frete'
        expect(page).to have_css('a', text: 'Login')
        expect(page).not_to have_css('a', text: 'Transportadoras')
        expect(page).not_to have_css('a', text: 'Veículos')
        expect(page).not_to have_css('a', text: 'Taxas de Frete')
        expect(page).not_to have_css('a', text: 'Prazos de Entrega')
        expect(page).not_to have_css('a', text: 'Consultar Frete')
        expect(page).not_to have_css('a', text: 'Registrar Pedido')
        expect(page).not_to have_css('a', text: 'Meus Pedidos')
    end
end
