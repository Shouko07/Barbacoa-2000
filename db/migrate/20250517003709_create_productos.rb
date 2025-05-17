class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :precio
      t.string :descripcion

      t.timestamps
    end
  end
end
