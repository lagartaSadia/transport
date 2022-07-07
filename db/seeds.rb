# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Carrier.create_or_find_by(corporate_name: 'Rodox Logistica', brand_name: 'Rodolog', domain: 'rodox.com', registered_number: '60150785000100', full_address: 'Estrada de Baixo, 99 - Joinville - SC')
Carrier.create_or_find_by(corporate_name: 'Logi Transportes', brand_name: 'Logi', domain: 'logi.com.br', registered_number: '12121212121212', full_address: 'Rua Maluca, 45 - Joaçaba - MG')

Vehicle.create_or_find_by(license_plate: 'MEC9096', brand: 'Volvo', vehicle_type: 'Caminhão', fabrication_date: 1990, capacity: 20000, carrier: carrier)

Order.create_or_find_by(vendor_address: 'Rua 1, 25 - Florianopolis - SC', item_code: 'RRSES12312', item_dimension: 0.8, item_weight: 2, client_address: 'Rua 14 - Blumenal - SC', client_information: 'Antonio Nunes', carrier: carrier, code: 'TRANSPOR9021PRO')

User.create_or_find_by(email: 'admin@sistemadefrete.com.br', password: 'password')
User.create_or_find_by(email: 'rodox@rodox.com', password: 'password')
User.create_or_find_by(email:'logi@logi.com.br', password: 'password')
