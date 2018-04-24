class CreateUserRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ranks do |t|
      t.references :user, null: false
      t.integer :type, null: false
      t.integer :rank, null: false
      t.integer :score
      t.timestamps
      t.index %i(user_id type), unique: true
    end
  end
end
