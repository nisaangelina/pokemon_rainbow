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

ActiveRecord::Schema.define(version: 2018_10_04_010708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokedexes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "base_health_point", null: false
    t.string "base_attack", null: false
    t.integer "base_defence", null: false
    t.integer "base_speed", null: false
    t.string "element_type", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "pokemon_id"
    t.integer "current_pp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemon_skills_on_pokemon_id"
    t.index ["skill_id"], name: "index_pokemon_skills_on_skill_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.bigint "pokedex_id"
    t.string "name", null: false
    t.integer "level", null: false
    t.integer "max_health_point", null: false
    t.integer "current_health_point", null: false
    t.integer "attack", null: false
    t.integer "defence", null: false
    t.integer "speed", null: false
    t.integer "current_experience", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokedex_id"], name: "index_pokemons_on_pokedex_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.integer "power", null: false
    t.integer "max_pp", null: false
    t.string "element_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemon_skills", "pokemons"
  add_foreign_key "pokemon_skills", "skills"
  add_foreign_key "pokemons", "pokedexes"
end
