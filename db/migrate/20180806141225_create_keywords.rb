class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :word, index: true
      t.string :kana, index: true
      t.timestamps
    end
  end
end
