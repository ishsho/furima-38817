class CreateTransacts < ActiveRecord::Migration[6.0]
  def change
    create_table :transacts do |t|
      t.string      :postal_code,         null: false
      t.integer     :area_id,             null: false
      t.string      :municipalities,      null: false
      t.string      :adress,              null: false
      t.string      :building
      t.string      :phone,               null: false
      t.references  :order,               null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
