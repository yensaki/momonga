class CreateTipLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :tip_likes do |t|
      t.references :tip, null: false
      t.references :user, null: false
      t.timestamps
      t.index %i(tip_id user_id), unique: true
    end
  end
end
