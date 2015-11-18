class AddColumnsToUser < ActiveRecord::Migration
  def change
      add_column :users, :nombre, :string
      add_column :users, :apellido, :string
      add_column :users, :celular, :string
      add_column :users, :genero, :string
      add_column :users, :edad, :integer
      add_column :users, :direccion, :string
      add_column :users, :pais, :string
      add_column :users, :ciudad, :string
      add_column :users, :puntos, :string
      add_column :users, :marcafav1, :string
      add_column :users, :marcafav2, :string
      add_column :users, :marcafav3, :string


  end
end
