class CreateEventos < ActiveRecord::Migration[8.0]
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :ubicacion
      t.string :tipo
      t.date :fecha
      t.string :estado
      t.integer :cantidad_pagada

      t.timestamps
    end
  end
end
