class ChangePrecioToIntegerInProductos < ActiveRecord::Migration[8.0]
def up
    # Paso 1: Crear columna temporal
    add_column :productos, :precio_temp, :decimal, precision: 10, scale: 2

    # Paso 2: Copiar datos con conversión (limpiando strings)
    Producto.reset_column_information
    Producto.find_each do |producto|
      # Quitar símbolos $ o comas si existen, luego convertir a decimal
      precio_limpio = producto.precio.to_s.gsub(/[$,]/, '').to_f
      producto.update_column(:precio_temp, precio_limpio)
    end

    # Paso 3: Quitar columna vieja
    remove_column :productos, :precio

    # Paso 4: Renombrar columna temporal
    rename_column :productos, :precio_temp, :precio
  end

  def down
    add_column :productos, :precio_temp, :string

    Producto.reset_column_information
    Producto.find_each do |producto|
      producto.update_column(:precio_temp, producto.precio.to_s)
    end

    remove_column :productos, :precio
    rename_column :productos, :precio_temp, :precio
  end
end
