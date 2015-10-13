class AddColumsKontest < ActiveRecord::Migration
  def change
      add_column :kontests, :amountwinners, :integer
      add_column :kontests, :amountcodes, :integer
  end
end
