class CreateTipBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :tip_bodies do |t|
      t.references :tip, null: false, index: true
      t.text :content
      t.timestamps
    end
  end
end
