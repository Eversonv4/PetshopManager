class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :nome
      t.decimal :preco
      t.integer :estoque
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
