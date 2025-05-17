class CreateOrdenProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :orden_productos do |t|
      t.references :orden, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad
      t.decimal :precio_unitario

      t.timestamps
    end
  end
end
