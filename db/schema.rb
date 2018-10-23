# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_06_141422) do

  create_table "keywords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "word"
    t.string "kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kana"], name: "index_keywords_on_kana"
    t.index ["word"], name: "index_keywords_on_word"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_movies_on_title"
  end

  create_table "oauth_authentications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "provider_id", null: false
    t.string "uid", null: false
    t.text "credentials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_authentications_on_uid"
    t.index ["user_id", "provider_id"], name: "index_oauth_authentications_on_user_id_and_provider_id", unique: true
    t.index ["user_id"], name: "index_oauth_authentications_on_user_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "taggable_type"
    t.integer "taggable_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_tags_on_keyword_id"
    t.index ["taggable_type", "taggable_id", "keyword_id"], name: "index_tags_on_taggable_type_and_taggable_id_and_keyword_id", unique: true
  end

  create_table "tip_bodies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tip_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_tip_bodies_on_tip_id"
  end

  create_table "tip_likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id", "user_id"], name: "index_tip_likes_on_tip_id_and_user_id", unique: true
    t.index ["tip_id"], name: "index_tip_likes_on_tip_id"
    t.index ["user_id"], name: "index_tip_likes_on_user_id"
  end

  create_table "tip_movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tip_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_tip_movies_on_movie_id"
    t.index ["tip_id"], name: "index_tip_movies_on_tip_id"
  end

  create_table "tips", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "user_icons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_icons_on_user_id"
  end

  create_table "user_ranks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "type", null: false
    t.integer "rank", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "type"], name: "index_user_ranks_on_user_id_and_type", unique: true
    t.index ["user_id"], name: "index_user_ranks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
