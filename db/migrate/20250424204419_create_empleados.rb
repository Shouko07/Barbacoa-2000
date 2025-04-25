class CreateEmpleados < ActiveRecord::Migration[8.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido_materno
      t.string :apellido_paterno
      t.string :puesto
      t.string :horario
      t.string :rfc
      t.string :telefono
      t.integer :edad
      t.date :fecha_contratacion

      t.timestamps
    end
  end
end
