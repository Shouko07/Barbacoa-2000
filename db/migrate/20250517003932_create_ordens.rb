class CreateOrdens < ActiveRecord::Migration[8.0]
  def change
    create_table :ordens do |t|
      t.integer :numero_personas
      t.integer :total
      t.references :mesa, null: false, foreign_key: true
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
