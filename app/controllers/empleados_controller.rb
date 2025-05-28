require "axlsx"

class EmpleadosController < ApplicationController
  before_action :set_empleado, only: %i[show edit update destroy]

  # GET /empleados or /empleados.json
  def index
    @empleados = Empleado.all
  end

  # GET /empleados/1 or /empleados/1.json
  def show
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados or /empleados.json
  def create
    preparar_horario_parametros
    @empleado = Empleado.new(empleado_params)

    respond_to do |format|
      if @empleado.save
        format.html { redirect_to @empleado, notice: "Empleado was successfully created." }
        format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1 or /empleados/1.json
  def update
    preparar_horario_parametros
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: "Empleado was successfully updated." }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados/1 or /empleados/1.json
  def destroy
    @empleado.destroy!

    respond_to do |format|
      format.html { redirect_to empleados_path, status: :see_other, notice: "Empleado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Export to Excel
  def exportar_excel
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(name: "Empleados") do |sheet|
      # Encabezados
      sheet.add_row [
        "Email", "Nombre", "Apellido Materno", "Apellido Paterno",
        "Puesto", "Horario", "RFC", "Teléfono", "Edad", "Fecha de Contratación"
      ]

      # Datos
      Empleado.all.each do |e|
        sheet.add_row [
          e.email,
          e.nombre,
          e.apellido_materno,
          e.apellido_paterno,
          e.puesto,
          e.horario,
          e.rfc,
          e.telefono,
          e.edad,
          e.fecha_contratacion.strftime("%d/%m/%Y") # formato de fecha
        ]
      end
    end

    # Enviar como descarga
    send_data p.to_stream.read,
              filename: "empleados.xlsx",
              type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  end

  private

  # Callback para cargar empleado por id
  def set_empleado
    @empleado = Empleado.find(params[:id])
  end

  # Para manejar el array horario de checkboxes y unirlo en un string separado por espacios
  def preparar_horario_parametros
    if params[:empleado] && params[:empleado][:horario].present?
      params[:empleado][:horario] = params[:empleado][:horario].join(" ")
    else
      params[:empleado][:horario] = ""
    end
  end

  # Solo parámetros permitidos
  def empleado_params
    params.require(:empleado).permit(
      :email, :nombre, :apellido_paterno, :apellido_materno,
      :puesto, :rfc, :telefono, :edad, :fecha_contratacion, :profile_image,
      :horario
    )
  end
end
