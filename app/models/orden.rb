class Orden < ApplicationRecord
  belongs_to :mesa
  belongs_to :empleado
  has_many :orden_productos
  has_many :productos, through: :orden_productos
end
