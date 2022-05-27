require 'rails_helper'

describe 'Usuário consulta condições de entrega' do
    it 'com sucesso' do
        carrier = Carrier.create!(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

        Price.create!(first_dimension: 0.001, second_dimension: 0.500, first_weight: 0, second_weight: 10, fee: 0.5, minimal_fee: 5, carrier: carrier)
        Price.create!(first_dimension: 0.001, second_dimension: 0.500, first_weight: 10, second_weight: 30, fee: 0.8, minimal_fee: 8, carrier: carrier)
        Price.create!(first_dimension: 0.501, second_dimension: 1.000, first_weight: 0, second_weight: 10, fee: 0.75, minimal_fee: 8, carrier: carrier)
        Price.create!(first_dimension: 0.501, second_dimension: 1.000, first_weight: 10, second_weight: 30, fee: 1.25, minimal_fee: 12, carrier: carrier)

        DeliveryTime.create!(first_distance: 0, second_distance: 50, time: 2, carrier: carrier)
        DeliveryTime.create!(first_distance: 50, second_distance: 100, time: 5, carrier: carrier)

        visit root_path
        click_on 'Consultar Frete'

        fill_in 'Dimensão do Item', with: '0.3'
        fill_in 'Peso do Item', with: '5'
        fill_in 'Distância de Entrega', with: '70'
        click_on 'Consultar'

        expect(page).to have_content 'Consulta de Frete'
        expect(page).to have_content 'Dimensão do Item: 0.3m³'
        expect(page).to have_content 'Peso do Item: 5.0kg'
        expect(page).to have_content 'Distância de Entrega: 70km'

        expect(page).to have_content 'Valor do Frete: R$ 35,00'
        expect(page).to have_content 'Tempo de Entrega: 5 dias'
    end

    it 'com campos inválidos' do
        visit root_path
        click_on 'Consultar Frete'

        fill_in 'Dimensão do Item', with: '0'
        fill_in 'Peso do Item', with: '5'
        fill_in 'Distância de Entrega', with: '70'
        click_on 'Consultar'

        expect(page).to have_content 'Consulta não pode ser realizada.'
        expect(page).to have_content 'Dimensão do Item deve ser maior que 0'
    end
end