class CreateAnimals < ActiveRecord::Migration[7.2]
  def change
    create_table :animals do |t|
      t.string :nome
      t.string :especie
      t.string :raca
      t.decimal :peso
      t.integer :cliente_id

      t.timestamps
    end
  end
end
