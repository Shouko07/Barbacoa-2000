class AddClienteAndTelefonoToEventos < ActiveRecord::Migration[8.0]
  def change
    add_column :eventos, :cliente, :string
    add_column :eventos, :telefono, :string
  end
end
