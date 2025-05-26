class CreateReportes < ActiveRecord::Migration[8.0]
  def change
    create_table :reportes do |t|
      t.date :fecha
      t.decimal :total_ventas
      t.integer :total_ordenes

      t.timestamps
    end
  end
end
