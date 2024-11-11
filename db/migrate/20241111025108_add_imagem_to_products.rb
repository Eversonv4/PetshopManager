class AddImagemToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :imagem, :string
  end
end
