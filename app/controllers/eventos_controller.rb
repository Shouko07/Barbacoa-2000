

class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  # GET /eventos or /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1 or /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

def exportar_excel
  require "axlsx"

  p = Axlsx::Package.new
  wb = p.workbook

  wb.add_worksheet(name: "Eventos") do |sheet|
    # Encabezados
    sheet.add_row [ "Nombre", "Descripción", "Ubicación", "Tipo", "Fecha", "Estado", "Cantidad pagada", "Creado", "Actualizado" ]

    # Datos
    Evento.all.each do |evento|
      sheet.add_row [
        evento.nombre,
        evento.descripcion,
        evento.ubicacion,
        evento.tipo,
        evento.fecha.strftime("%d/%m/%Y"),
        evento.estado,
        evento.cantidad_pagada,
        evento.created_at.strftime("%d/%m/%Y %H:%M"),
        evento.updated_at.strftime("%d/%m/%Y %H:%M")
      ]
    end
  end

  send_data p.to_stream.read,
            filename: "eventos.xlsx",
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
end


  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos or /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: "Evento was successfully created." }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1 or /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: "Evento was successfully updated." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1 or /eventos/1.json
  def destroy
    @evento.destroy!

    respond_to do |format|
      format.html { redirect_to eventos_path, status: :see_other, notice: "Evento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def evento_params
      params.expect(evento: [ :nombre, :descripcion, :ubicacion, :tipo, :fecha, :estado, :cantidad_pagada ])
    end
end
