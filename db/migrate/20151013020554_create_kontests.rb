class CreateKontests < ActiveRecord::Migration
  def change
    create_table :kontests do |t|
      t.string :clientcode
      t.string :clientname
      t.datetime :startdate
      t.datetime :enddate
      t.string :admin
      t.string :award
      

      t.timestamps null: false
    end
  end
end
