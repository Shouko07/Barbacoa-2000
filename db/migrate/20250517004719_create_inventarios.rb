class CreateInventarios < ActiveRecord::Migration[8.0]
  def change
    create_table :inventarios do |t|
      t.string :producto
      t.integer :cantidad
      t.string :tipo_almacenamiento

      t.timestamps
    end
  end
end
