class Imagen < ActiveRecord::Migration[8.0]
  def change
       # Agregar un campo para la imagen usando Active Storage
    add_reference :empleados, :profile_image, foreign_key: { to_table: :active_storage_attachments }

  end
end
