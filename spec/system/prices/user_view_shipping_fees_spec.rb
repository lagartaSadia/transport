require 'rails_helper'

describe 'Usuário acessa a tela de taxas de frete' do
    it 'a partir da tela inicial' do
        
        visit root_path
        click_on 'Taxas de Frete'

        expect(page).to have_content 'Lista de Taxas de Frete'
    end

    it 'e vê lista de taxas cadastradas' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        Price.create!(first_dimension: 0.001, second_dimension: 0.500, first_weight: 0, second_weight: 10, fee: 0.5, minimal_fee: 5, carrier: carrier)
        Price.create!(first_dimension: 0.001, second_dimension: 0.500, first_weight: 10, second_weight: 30, fee: 0.8, minimal_fee: 8, carrier: carrier)
        Price.create!(first_dimension: 0.501, second_dimension: 1.000, first_weight: 0, second_weight: 10, fee: 0.75, minimal_fee: 8, carrier: carrier)
        Price.create!(first_dimension: 0.501, second_dimension: 1.000, first_weight: 10, second_weight: 30, fee: 1.25, minimal_fee: 12, carrier: carrier)

        visit root_path
        click_on 'Taxas de Frete'

        expect(page).to have_content 'Taxas da Logi Transportes'
        expect(page).to have_content 'Dimensão'
        expect(page).to have_content 'Peso'
        expect(page).to have_content 'Valor por KM'
        expect(page).to have_content 'Valor mínimo'

        expect(page).to have_content '0.001 até 0.5m³'
        expect(page).to have_content '0.0 até 10.0kg'
        expect(page).to have_content 'R$ 0,50'
        expect(page).to have_content 'R$ 5,00'
    end
end