require "csv"

class Product < ApplicationRecord
  belongs_to :category

  def self.import_from_csv(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      product_data = row.to_hash # Converte cada linha do CSV em um hash
      Product.create!(product_data) # Cria um novo produto com os dados da linha
    end
  rescue StandardError => e
    puts "Erro ao importar CSV: #{e.message}"
  end
end
