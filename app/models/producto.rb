class Producto < ApplicationRecord
    has_many :orden_productos
  has_many :ordenes, through: :orden_productos
end
