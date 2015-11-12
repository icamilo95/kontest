class CreateUnicodes < ActiveRecord::Migration
  def change
    create_table :unicodes do |t|
      t.string :secuence
      t.boolean :winner
      t.integer :kontest_id
      t.string :clientcode
      t.integer :user_id
      t.datetime :registrationdate

      t.timestamps null: false
    end
  end
end
