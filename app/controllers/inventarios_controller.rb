require "axlsx"

class InventariosController < ApplicationController
  before_action :authenticate_empleado!
  before_action :set_inventario, only: %i[ show edit update destroy ]

  # GET /inventarios or /inventarios.json
  def index
    @inventarios = Inventario.all
  end

  # GET /inventarios/1 or /inventarios/1.json
  def show
  end

  # GET /inventarios/new
  def new
    @inventario = Inventario.new
  end

  # GET /inventarios/1/edit
  def edit
  end

  # POST /inventarios or /inventarios.json
  def create
    @inventario = Inventario.new(inventario_params)

    respond_to do |format|
      if @inventario.save
        format.html { redirect_to @inventario, notice: "Inventario was successfully created." }
        format.json { render :show, status: :created, location: @inventario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  def exportar_excel
  p = Axlsx::Package.new
  wb = p.workbook

  wb.add_worksheet(name: "Inventario") do |sheet|
    # Encabezados
    sheet.add_row [
      "Producto", "Cantidad", "Tipo de almacenamiento", "Creado", "Actualizado"
    ]

    # Datos
    Inventario.all.each do |i|
      sheet.add_row [
        i.producto,
        i.cantidad,
        i.tipo_almacenamiento,
        i.created_at.strftime("%d/%m/%Y %H:%M"),   # Fecha y hora formato día/mes/año
        i.updated_at.strftime("%d/%m/%Y %H:%M")
      ]
    end
  end
      send_data p.to_stream.read,
              filename: "producto.xlsx",
              type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  # Para enviar o guardar el archivo, depende de tu uso:
  # p.serialize('inventario.xlsx') # para guardar localmente
  # o devolver el paquete para descargar
end

  # PATCH/PUT /inventarios/1 or /inventarios/1.json
  def update
    respond_to do |format|
      if @inventario.update(inventario_params)
        format.html { redirect_to @inventario, notice: "Inventario was successfully updated." }
        format.json { render :show, status: :ok, location: @inventario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventarios/1 or /inventarios/1.json
  def destroy
    @inventario.destroy!

    respond_to do |format|
      format.html { redirect_to inventarios_path, status: :see_other, notice: "Inventario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
      @inventario = Inventario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def inventario_params
      params.expect(inventario: [ :producto, :cantidad, :tipo_almacenamiento ])
    end
end
