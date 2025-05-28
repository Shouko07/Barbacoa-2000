class ReportesController < ApplicationController
  before_action :authenticate_empleado!
  def index
    # Vista con calendario
  end

def por_fecha
  fecha = params[:fecha].presence || Date.today.to_s
  fecha = Date.parse(fecha) rescue Date.today

  @ordenes = Orden.where(created_at: fecha.beginning_of_day..fecha.end_of_day)

  @productos_consumidos = OrdenProducto
    .joins(:orden, :producto)
    .where(ordens: { created_at: fecha.beginning_of_day..fecha.end_of_day })
    .group("productos.nombre")
    .select("productos.nombre as nombre, SUM(orden_productos.cantidad) as total_cantidad, SUM(orden_productos.cantidad * productos.precio) as total_dinero")
    .order("total_cantidad DESC")

  respond_to do |format|
    format.html { render :por_fecha }
    format.json { render json: @ordenes }
  end
end
def por_mes_excel
  mes = params[:mes].presence || Date.today.strftime("%Y-%m")
  inicio = Date.strptime(mes, "%Y-%m").beginning_of_month
  fin = inicio.end_of_month

  dias = Orden.where(created_at: inicio..fin)
              .group("DATE(created_at)")
              .select("DATE(created_at) as dia, SUM(total) as total_dia, COUNT(*) as cantidad_ordenes")
              .order("dia ASC")

  productos = OrdenProducto
    .joins(:orden, :producto)
    .where(ordens: { created_at: inicio..fin })
    .group("productos.nombre")
    .select("productos.nombre as nombre, SUM(orden_productos.cantidad) as total_cantidad, SUM(orden_productos.cantidad * productos.precio) as total_dinero")
    .order("total_cantidad DESC")

  require "axlsx"
  p = Axlsx::Package.new
  wb = p.workbook

  wb.add_worksheet(name: "Reporte mensual") do |sheet|
    # Fila 1: Total del mes
    total_mes = dias.sum { |d| d.total_dia.to_f }
    sheet.add_row [ "Total del mes:", total_mes ], style: [ nil, wb.styles.add_style(num_fmt: 4) ]

    # Fila 2: Encabezados de la tabla de días
    sheet.add_row [ "#", "Día", "Total del día", "Órdenes" ]

    # Fila 3+: Datos de la tabla de días
    dias.each_with_index do |dia, idx|
      sheet.add_row [
        idx + 1,
        Date.parse(dia.dia).strftime("%d/%m/%Y"),
        dia.total_dia,
        dia.cantidad_ordenes
      ]
    end

    # Fila vacía
    sheet.add_row []

    # Fila 4: Encabezados de la tabla de productos
    sheet.add_row [ "Producto", "Cantidad consumida", "Total ganado" ]

    # Fila 5+: Datos de la tabla de productos
    productos.each do |prod|
      sheet.add_row [
        prod.nombre,
        prod.total_cantidad,
        prod.total_dinero
      ]
    end
  end

  send_data p.to_stream.read,
            filename: "reporte_mes_#{mes}.xlsx",
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
end


def por_fecha_excel
  fecha = params[:fecha].presence || Date.today.to_s
  fecha = Date.parse(fecha) rescue Date.today

  ordenes = Orden.where(created_at: fecha.beginning_of_day..fecha.end_of_day)

  productos = OrdenProducto
    .joins(:orden, :producto)
    .where(ordens: { created_at: fecha.beginning_of_day..fecha.end_of_day })
    .group("productos.nombre")
    .select("productos.nombre as nombre, SUM(orden_productos.cantidad) as total_cantidad, SUM(orden_productos.cantidad * productos.precio) as total_dinero")
    .order("total_cantidad DESC")

  require "axlsx"
  p = Axlsx::Package.new
  wb = p.workbook

  wb.add_worksheet(name: "Reporte diario") do |sheet|
    # Fila 1: Total del día
    total_dia = ordenes.sum(&:total)
    sheet.add_row [ "Total del día:", total_dia ], style: [ nil, wb.styles.add_style(num_fmt: 4) ]

    # Fila 2: Encabezados de la tabla de órdenes
    sheet.add_row [ "Mesa", "Total", "Empleado", "Estado", "Fecha" ]

    # Fila 3+: Datos de la tabla de órdenes
    ordenes.each do |orden|
      sheet.add_row [
        orden.mesa_id,
        orden.total,
        orden.empleado_id,
        orden.estado_orden ? "Abierta" : "Cerrada",
        orden.created_at.strftime("%d/%m/%Y %H:%M")
      ]
    end

    # Fila vacía
    sheet.add_row []

    # Fila 4: Encabezados de la tabla de productos
    sheet.add_row [ "Producto", "Cantidad consumida", "Total ganado" ]

    # Fila 5+: Datos de la tabla de productos
    productos.each do |prod|
      sheet.add_row [
        prod.nombre,
        prod.total_cantidad,
        prod.total_dinero
      ]
    end
  end

  send_data p.to_stream.read,
            filename: "reporte_dia_#{fecha.strftime("%Y-%m-%d")}.xlsx",
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
end
def por_mes
  # Obtener el mes desde params o usar el mes actual
  mes = params[:mes].presence || Date.today.strftime("%Y-%m")
  inicio = Date.strptime(mes, "%Y-%m").beginning_of_month
  fin = inicio.end_of_month

  @mes = mes
  @dias = Orden.where(created_at: inicio..fin)
               .group("DATE(created_at)")
               .select("DATE(created_at) as dia, SUM(total) as total_dia, COUNT(*) as cantidad_ordenes")
               .order("dia ASC")
# Nueva consulta: productos consumidos en el mes
@productos_consumidos = OrdenProducto
  .joins(:orden, :producto)
  .where(ordens: { created_at: inicio..fin })
  .group("productos.nombre")
.select("productos.nombre as nombre, SUM(orden_productos.cantidad) as total_cantidad, SUM(orden_productos.cantidad * productos.precio) as total_dinero")  .order("total_cantidad DESC")
  respond_to do |format|
    format.html { render :por_mes }
    format.json { render json: @dias }
  end
end
end
