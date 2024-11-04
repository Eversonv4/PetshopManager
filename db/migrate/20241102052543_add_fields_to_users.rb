class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :nome, :string
    add_column :users, :telefone, :string
    add_column :users, :role, :string
  end
end
