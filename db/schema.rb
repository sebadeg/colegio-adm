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

ActiveRecord::Schema.define(version: 2019_11_17_184021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "acceso", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_usuarios_on_reset_password_token", unique: true
  end

  create_table "alumnos", force: :cascade do |t|
    t.integer "cedula"
    t.string "nombre"
    t.string "apellido"
    t.string "lugar_nacimiento"
    t.date "fecha_nacimiento"
    t.string "domicilio"
    t.string "celular"
    t.string "mutualista"
    t.string "emergencia"
    t.string "procede"
    t.integer "anio_ingreso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuenta_alumnos", force: :cascade do |t|
    t.bigint "cuenta_id"
    t.bigint "alumno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_cuenta_alumnos_on_alumno_id"
    t.index ["cuenta_id"], name: "index_cuenta_alumnos_on_cuenta_id"
  end

  create_table "cuentas", force: :cascade do |t|
    t.string "nombre"
    t.text "comentario"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grados", force: :cascade do |t|
    t.string "nombre"
    t.integer "proximo_grado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "padre_alumnos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "alumno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_padre_alumnos_on_alumno_id"
    t.index ["usuario_id"], name: "index_padre_alumnos_on_usuario_id"
  end

  create_table "rubros", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titular_cuentas", force: :cascade do |t|
    t.bigint "cuenta_id"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuenta_id"], name: "index_titular_cuentas_on_cuenta_id"
    t.index ["usuario_id"], name: "index_titular_cuentas_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "cedula"
    t.string "nombre"
    t.string "apellido"
    t.string "lugar_nacimiento"
    t.date "fecha_nacimiento"
    t.string "domicilio"
    t.string "celular"
    t.string "profesion"
    t.string "trabajo"
    t.string "telefono_trabajo"
    t.boolean "habilitado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "cuenta_alumnos", "alumnos"
  add_foreign_key "cuenta_alumnos", "cuentas"
  add_foreign_key "padre_alumnos", "alumnos"
  add_foreign_key "padre_alumnos", "usuarios"
  add_foreign_key "titular_cuentas", "cuentas"
  add_foreign_key "titular_cuentas", "usuarios"
end
