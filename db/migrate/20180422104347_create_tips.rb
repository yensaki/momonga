class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.references :user, null: false, index: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
