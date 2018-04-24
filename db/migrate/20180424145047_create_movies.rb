class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, index: true
      t.string :url, null: false
      t.timestamps
    end
  end
end
