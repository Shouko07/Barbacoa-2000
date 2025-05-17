class CreateJoinTableOrdenesProductos < ActiveRecord::Migration[8.0]
  def change
    create_join_table :ordens, :productos do |t|
       t.index [:orden_id, :producto_id]
       t.index [:producto_id, :orden_id]
    end
  end
end
