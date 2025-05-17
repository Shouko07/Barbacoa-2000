class OrdenProducto < ApplicationRecord
  belongs_to :orden
  belongs_to :producto

    # Validaciones opcionales
  validates :cantidad, numericality: { only_integer: true, greater_than: 0 }
  validates :precio_unitario, numericality: { greater_than_or_equal_to: 0 }
end
