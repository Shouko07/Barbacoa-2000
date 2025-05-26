class OrdensController < ApplicationController
  before_action :set_orden, only: %i[ show edit update destroy ]

  # GET /ordens or /ordens.json
  def index
    @ordens = Orden.all
  end

  # GET /ordens/1 or /ordens/1.json
  def show
    @orden = Orden.find(params[:id])
     @productos = Producto.all
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens or /ordens.json
  def create
    @orden = Orden.new(orden_params)

    respond_to do |format|
      if @orden.save
        format.html { redirect_to @orden, notice: "Orden was successfully created." }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1 or /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to @orden, notice: "Orden was successfully updated." }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1 or /ordens/1.json
  def destroy
    @orden.destroy!

    respond_to do |format|
      format.html { redirect_to ordens_path, status: :see_other, notice: "Orden was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def cerrar
  @orden = Orden.find(params[:id])

  # Calcular total sumando cantidad * precio de los productos asociados
  total_calculado = @orden.orden_productos.sum do |op|
    op.cantidad * op.producto.precio
  end

  # Actualizar estado_orden y total
  if @orden.update(estado_orden: false, total: total_calculado)
    fecha = @orden.created_at.to_date

    # Actualizar o crear reporte para esa fecha
    reporte = Reporte.find_or_initialize_by(fecha: fecha)
    reporte.total_ordenes = Orden.where(created_at: fecha.beginning_of_day..fecha.end_of_day).count
    reporte.total_ventas = Orden.where(created_at: fecha.beginning_of_day..fecha.end_of_day).sum(:total)
    reporte.save if reporte.changed?

    redirect_to reporte_por_fecha_path(fecha: fecha), notice: "Orden cerrada y reporte actualizado."
  else
    redirect_back fallback_location: orden_path(@orden), alert: "No se pudo cerrar la orden."
  end
end


  def detalle_compra
    @orden = Orden.find(params[:id])
    @productos = @orden.orden_productos.includes(:producto)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def orden_params
      params.expect(orden: [ :numero_personas, :total, :mesa_id, :empleado_id ])
    end
end
