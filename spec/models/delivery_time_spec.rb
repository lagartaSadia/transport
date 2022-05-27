require 'rails_helper'

RSpec.describe DeliveryTime, type: :model do
    describe '#valid?' do
        context 'campo obrigatório' do
            it 'first_distance é obrigatório' do
                delivery = DeliveryTime.new(first_distance: '')

                delivery.valid?
                result = delivery.errors.include?(:first_distance)

                expect(result).to be true
            end

            it 'second_distance é obrigatório' do
                delivery = DeliveryTime.new(second_distance: '')

                delivery.valid?
                result = delivery.errors.include?(:second_distance)

                expect(result).to be true
            end

            it 'time é obrigatório' do
                delivery = DeliveryTime.new(second_distance: '')

                delivery.valid?
                result = delivery.errors.include?(:time)

                expect(result).to be true
            end
        end

        context 'é número' do
            it 'first_distance é número' do
                delivery = DeliveryTime.new(first_distance: 'a', second_distance: 50, time: 3)

                expect(delivery.valid?).to be false
            end

            it 'second_distance é número' do
                delivery = DeliveryTime.new(first_distance: 'a', second_distance: 'a', time: 3)

                expect(delivery.valid?).to be false
            end

            it 'time é número' do
                delivery = DeliveryTime.new(first_distance: 0, second_distance: 50, time: 's')

                expect(delivery.valid?).to be false
            end
        end

        it 'time é maior que 0' do
            delivery = DeliveryTime.new(first_distance: 0, second_distance: 'a', time: 0)

            expect(delivery.valid?).to be false
        end
    end
end
#first_distance, :second_distance, :time