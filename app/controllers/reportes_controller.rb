class ReportesController < ApplicationController
  def index
    # Vista con calendario
  end

  def por_fecha
    fecha = params[:fecha].presence || Date.today.to_s
    fecha = Date.parse(fecha) rescue Date.today

    @ordenes = Orden.where(created_at: fecha.beginning_of_day..fecha.end_of_day)

    respond_to do |format|
      format.html { render :por_fecha }
      format.json { render json: @ordenes }
    end
  end
end
