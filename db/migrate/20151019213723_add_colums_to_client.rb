class AddColumsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :clients, :contacto, :string
    add_column :clients, :celular, :string
    add_column :clients, :telefono, :string
    add_column :clients, :comentarios, :string
    add_column :clients, :direccion, :string
    add_column :clients, :codigo, :string
    add_column :clients, :pais, :string
    add_column :clients, :ciudad, :string
    add_column :clients, :logo, :string
  end
end
