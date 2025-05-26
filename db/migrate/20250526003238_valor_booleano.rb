class ValorBooleano < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE ordens SET estado_orden = true WHERE estado_orden IS NULL;
    SQL

    change_column_default :ordens, :estado_orden, true
    change_column_null :ordens, :estado_orden, false
  end

  def down
    change_column_null :ordens, :estado_orden, true
    change_column_default :ordens, :estado_orden, false
  end
end
