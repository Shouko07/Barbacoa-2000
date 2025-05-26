class OrdenProducto < ApplicationRecord
  belongs_to :orden
  belongs_to :producto

  # Validaciones opcionales
  validates :cantidad, numericality: { only_integer: true, greater_than: 0 }
end
