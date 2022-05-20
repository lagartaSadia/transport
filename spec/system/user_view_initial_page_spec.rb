require 'rails_helper'

describe 'Visitante acessa a tela inicial' do
    it 'e vê o nome da aplicação' do
        visit root_path

        expect(page).to have_content 'Sistema de Frete'
    end
end
