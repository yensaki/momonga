class CreateUserIcons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_icons do |t|
      t.references :user, null: false, index: true
      t.string :url, null: false
      t.timestamps
    end
  end
end
