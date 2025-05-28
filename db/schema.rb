# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_28_193558) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido_materno"
    t.string "apellido_paterno"
    t.string "puesto"
    t.string "horario"
    t.string "rfc"
    t.string "telefono"
    t.integer "edad"
    t.date "fecha_contratacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "profile_image_id"
    t.index ["email"], name: "index_empleados_on_email", unique: true
    t.index ["profile_image_id"], name: "index_empleados_on_profile_image_id"
    t.index ["reset_password_token"], name: "index_empleados_on_reset_password_token", unique: true
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "ubicacion"
    t.string "tipo"
    t.date "fecha"
    t.string "estado"
    t.integer "cantidad_pagada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cliente"
    t.string "telefono"
  end

  create_table "inventarios", force: :cascade do |t|
    t.string "producto"
    t.integer "cantidad"
    t.string "tipo_almacenamiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mesas", force: :cascade do |t|
    t.integer "numero"
    t.string "disponibilidad"
    t.integer "capacidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orden_productos", force: :cascade do |t|
    t.integer "orden_id", null: false
    t.integer "producto_id", null: false
    t.integer "cantidad"
    t.decimal "precio_unitario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_orden_productos_on_orden_id"
    t.index ["producto_id"], name: "index_orden_productos_on_producto_id"
  end

  create_table "ordens", force: :cascade do |t|
    t.integer "numero_personas"
    t.integer "total"
    t.integer "mesa_id", null: false
    t.integer "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "estado_orden", default: true, null: false
    t.index ["empleado_id"], name: "index_ordens_on_empleado_id"
    t.index ["mesa_id"], name: "index_ordens_on_mesa_id"
  end

  create_table "ordens_productos", id: false, force: :cascade do |t|
    t.integer "orden_id", null: false
    t.integer "producto_id", null: false
    t.index ["orden_id", "producto_id"], name: "index_ordens_productos_on_orden_id_and_producto_id"
    t.index ["producto_id", "orden_id"], name: "index_ordens_productos_on_producto_id_and_orden_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "precio", precision: 10, scale: 2
  end

  create_table "reportes", force: :cascade do |t|
    t.date "fecha"
    t.decimal "total_ventas"
    t.integer "total_ordenes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "empleados", "active_storage_attachments", column: "profile_image_id"
  add_foreign_key "orden_productos", "ordens"
  add_foreign_key "orden_productos", "productos"
  add_foreign_key "ordens", "empleados"
  add_foreign_key "ordens", "mesas"
end
