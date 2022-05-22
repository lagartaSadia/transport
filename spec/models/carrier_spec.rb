require 'rails_helper'

RSpec.describe Carrier, type: :model do
    describe '#valid?' do
        context 'Todos os campos são obrigatórios' do
            it 'corporate_name é obrigatório' do
                carrier = Carrier.new(corporate_name: '', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end
    
            it 'brand_name é obrigatório' do
                carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: '', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end
    
            it 'domain é obrigatório' do
                carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: '', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end    
    
            it 'registered_number é obrigatório' do
                carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end      
    
            it 'full_address é obrigatório' do
                carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: '')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end 
        end

        context 'CNPJ tem 14 digitos e é unico' do
            it 'CNPJ não possuí 14 digitos' do
                carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '0511', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                result = carrier.valid?
    
                expect(result).to eq false
            end
    
            it 'CNPJ já está em uso' do
                first_carrier = Carrier.create!(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
                second_carrier = Carrier.new(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '05116996000119', full_address: 'Estrada de Baixo, 99 - Joinville - SC')
    
                result = second_carrier.valid?
    
                expect(result).to eq false
            end
        end

        it 'corporate_name já foi usado' do
            first_carrier = Carrier.create!(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
            second_carrier = Carrier.new(corporate_name: 'Azul Transportes', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

            result = second_carrier.valid?

            expect(result).to eq false
        end

        it 'domain já foi usado' do
            first_carrier = Carrier.create!(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
            second_carrier = Carrier.new(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'azul.com.br', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')

            result = second_carrier.valid?

            expect(result).to eq false
        end
    end
end

# first_carrier = Carrier.create!(corporate_name: 'Azul Transportes', brand_name: 'Azul', domain: 'azul.com.br', registered_number: '05116996000119', full_address: 'Av Limoeiro, 111 - Jaraguá - SC')
    
# second_carrier = Carrier.new(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')