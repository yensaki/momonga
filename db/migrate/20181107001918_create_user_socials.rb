class CreateUserSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :user_socials do |t|
      t.references :user, null: false, index: true
      t.string :twitter
      t.timestamps
    end
  end
end
