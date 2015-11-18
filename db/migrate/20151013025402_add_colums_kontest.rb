class AddColumsKontest < ActiveRecord::Migration
  def change
      add_column :kontests, :amountwinners, :integer
      add_column :kontests, :amountcodes, :integer
      add_column :kontests, :kontestcode, :string
  end
end
