class CreateOauthAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth_authentications do |t|
      t.references :user, null: false
      t.integer :provider, null: false
      t.string :uid, null: false
      t.text :credentials
      t.timestamps
      t.index %i(user_id provider), unique: true
      t.index :uid
    end
  end
end
