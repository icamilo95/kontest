class CreateKontestusers < ActiveRecord::Migration
  def change
    create_table :kontestusers do |t|
      t.integer :kontest_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
