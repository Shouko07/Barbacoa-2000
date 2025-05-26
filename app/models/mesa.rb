class Mesa < ApplicationRecord
  has_many :ordens
    after_initialize :set_default_disponibilidad, if: :new_record?

  def set_default_disponibilidad
    self.disponibilidad ||= "Disponible"
  end
end
