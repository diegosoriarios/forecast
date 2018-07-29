class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :country_cod, :string
  end
end
