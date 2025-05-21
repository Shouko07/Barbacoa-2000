class Empleado < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :nombre, :apellido_paterno, :apellido_materno, :puesto, :horario, :rfc, :telefono, :edad, :fecha_contratacion, presence: true
    validates :rfc, length: { is: 13 }
    validates :telefono, length: { is: 10 }
    validates :edad, numericality: { greater_than_or_equal_to: 18 }

  # Relación con Active Storage
  has_one_attached :profile_image
end
