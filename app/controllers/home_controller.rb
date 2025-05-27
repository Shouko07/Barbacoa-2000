class HomeController < ApplicationController
  def index
    @eventos_proximos_count = Evento.where("fecha >= ?", Date.today).count

    # Asumiendo que 'disponibilidad' tiene valor 'ocupada' para mesas ocupadas
    @mesas_ocupadas_count = Mesa.where(disponibilidad: "Disponible").count

    @ordenes_semana = Orden.where(created_at: 6.days.ago.beginning_of_day..Time.current.end_of_day)
    @ganancias_por_dia = @ordenes_semana.group_by { |o| o.created_at.to_date }
                                     .transform_values { |ordenes| ordenes.sum(&:total) }
    @ordenes_mes = Orden.where(created_at: Time.current.beginning_of_month..Time.current.end_of_day)
    @ganancias_mes_por_dia = @ordenes_mes.group_by { |o| o.created_at.to_date }
                                    .transform_values { |ordenes| ordenes.sum(&:total) }
  end
  def dashboard
  end
end
