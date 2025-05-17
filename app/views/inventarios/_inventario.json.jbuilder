json.extract! inventario, :id, :producto, :cantidad, :tipo_almacenamiento, :created_at, :updated_at
json.url inventario_url(inventario, format: :json)
