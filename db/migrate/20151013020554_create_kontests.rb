class CreateKontests < ActiveRecord::Migration
  def change
    create_table :kontests do |t|
      t.string :clientcode
      t.string :clientname
      t.datetime :startdate
      t.datetime :enddate
      t.string :admin
      t.string :award
      t.integer :client_id
      

      t.timestamps null: false
    end
  end
end
