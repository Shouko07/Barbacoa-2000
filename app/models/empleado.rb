class Empleado < ApplicationRecord
    validates :nombre, :apellido_paterno, :apellido_materno, :puesto, :horario, :rfc, :telefono, :edad, :fecha_contratacion, presence: true
    validates :rfc, length: { is: 13 }
    validates :telefono, length: { is: 10 }
    validates :edad, numericality: { greater_than_or_equal_to: 18 }
end
