json.extract! empleado, :id, :nombre, :apellido_materno, :apellido_paterno, :puesto, :horario, :rfc, :telefono, :edad, :fecha_contratacion, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
