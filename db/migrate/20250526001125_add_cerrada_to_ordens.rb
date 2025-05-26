class AddCerradaToOrdens < ActiveRecord::Migration[8.0]
  def change
    add_column :ordens, :estado_orden, :boolean
  end
end
