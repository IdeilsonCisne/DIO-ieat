require 'rails_helper'

RSpec.describe Restaurant do
	it { should have_many(:products) } # Testar relacionamento
	# Primeira forma de testes sem uso de gem
	context 'Testing total of products' do
		it 'returns total of products for a specific restaurant' do
			restaurant = Restaurant.create(name: "restaurant 1", address: "Rua 1")

			product1 = Product.create(name: "BK 1", value: 45.0, restaurant: restaurant)
			product2 = Product.create(name: "BK 2", value: 25.0, restaurant: restaurant)
			product3 = Product.create(name: "BK 3", value: 35.0, restaurant: restaurant)

			expect(restaurant.total_of_products).to eq 3
		end
	end

	# Segunda forma de testes com uso de gem FactoryBot
	context 'Testing total of products' do
		it 'returns total of products for a specific restaurant' do
			restaurant = FactoryBot.create(:restaurant)

			product1 = FactoryBot.create(:product, restaurant: restaurant)
			product2 = FactoryBot.create(:product, restaurant: restaurant)
			product3 = FactoryBot.create(:product, restaurant: restaurant)

			expect(restaurant.total_of_products).to eq 3
		end
	end

	# Terceira forma(reduzida do anterior) de testes com uso de gem FactoryBot (Refatoração do teste anterior)
	context 'Testing total of products' do
		let(:restaurant) { FactoryBot.create(:restaurant) }

		before do
			product1 = FactoryBot.create(:product, restaurant: restaurant)
			product2 = FactoryBot.create(:product, restaurant: restaurant)
			product3 = FactoryBot.create(:product, restaurant: restaurant)
		end

		it 'returns total of products for a specific restaurant' do
			expect(restaurant.total_of_products).to eq 3
		end
	end

	# Quarta forma(reduzida do anterior) de testes com uso de gem FactoryBot (Refatoração do teste anterior)
	context 'Testing total of products' do
		let(:restaurant) { FactoryBot.create(:restaurant) }
		let(:total) { rand(5) }
		before do
			(1..total).each do |item|
				FactoryBot.create(:product, restaurant: restaurant)
			end
		end

		it 'returns total of products for a specific restaurant' do
			expect(restaurant.total_of_products).to eq 3
		end
	end

end