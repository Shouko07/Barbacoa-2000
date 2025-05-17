json.extract! evento, :id, :nombre, :descripcion, :ubicacion, :tipo, :fecha, :estado, :cantidad_pagada, :created_at, :updated_at
json.url evento_url(evento, format: :json)
