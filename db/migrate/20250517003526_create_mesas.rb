class CreateMesas < ActiveRecord::Migration[8.0]
  def change
    create_table :mesas do |t|
      t.integer :numero
      t.string :disponibilidad
      t.integer :capacidad

      t.timestamps
    end
  end
end
