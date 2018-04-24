class CreateTipMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :tip_movies do |t|
      t.references :tip, null: false, index: true
      t.references :movie, null: false, index: true
      t.timestamps
    end
  end
end
