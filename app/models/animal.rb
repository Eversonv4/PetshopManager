class Animal < ApplicationRecord
  belongs_to :cliente, class_name: "User", foreign_key: "cliente_id"

  validates :nome, presence: true
  validates :especie, presence: true
  validates :raca, presence: true
  validates :peso, presence: true, numericality: { greater_than: 0 }
end
