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

ActiveRecord::Schema.define(version: 20171128211835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.datetime "data_evento"
    t.text     "local_evento"
    t.datetime "hora_montagem"
    t.datetime "hora_desmontagem"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cliente_id"], name: "index_eventos_on_cliente_id", using: :btree
  end

  create_table "historicos", force: :cascade do |t|
    t.integer  "evento_id"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_historicos_on_evento_id", using: :btree
  end

  add_foreign_key "eventos", "clientes"
  add_foreign_key "historicos", "eventos"
end