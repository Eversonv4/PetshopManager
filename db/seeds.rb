# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default admin user
User.find_or_create_by!(email: "everson@email.com") do |user|
  user.password = "123456"
  user.password_confirmation = "123456"
  user.role = "admin"
  user.nome = "Everson"
  user.telefone = "999999999"
end

# Create a default cliente user
cliente_user = User.find_or_create_by!(email: "vinicius@email.com") do |user|
  user.password = "123456"
  user.password_confirmation = "123456"
  user.role = "cliente"
  user.nome = "Vinicius"
  user.telefone = "999999999"
end

# Create a default cliente user
Animal.create(
  nome: "Luke",
  especie: "cachorro",
  raca: "chihuahua",
  peso: 2.5,
  cliente_id: cliente_user.id
)
