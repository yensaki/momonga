class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :taggable_type
      t.integer :taggable_id
      t.integer :keyword_id
      t.timestamps
      t.index [:taggable_type, :taggable_id, :keyword_id], unique: true
      t.index :keyword_id
    end
  end
end
