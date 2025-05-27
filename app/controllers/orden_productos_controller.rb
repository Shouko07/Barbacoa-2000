class OrdenProductosController < ApplicationController
  def create
    @orden = Orden.find(params[:orden_id])
    producto_id = params[:producto_id]
    cantidad = params[:cantidad].to_i

    # Aquí puedes validar la cantidad y producto_id antes de continuar

    orden_producto = @orden.orden_productos.find_or_initialize_by(producto_id: producto_id)
    orden_producto.cantidad = (orden_producto.cantidad || 0) + cantidad
    # Si tienes precio unitario, podrías calcularlo aquí:
    # orden_producto.precio_unitario = Producto.find(producto_id).precio

    if orden_producto.save
      redirect_to orden_path(@orden), notice: "Producto agregado correctamente."
    else
      redirect_to orden_path(@orden), alert: "No se pudo agregar el producto."
    end
  end
def edit
  @orden_producto = OrdenProducto.find(params[:id])
  @orden = @orden_producto.orden
  @empleados = Empleado.all
end

def update
  @orden_producto = OrdenProducto.find(params[:id])
  @orden = @orden_producto.orden

  if @orden_producto.update(orden_producto_params) && @orden.update(empleado_id: params[:orden][:empleado_id])
    redirect_to orden_path(@orden), notice: "OrdenProducto y empleado actualizados correctamente."
  else
    @empleados = Empleado.all
    render :edit
  end
end

private

def orden_producto_params
  params.require(:orden_producto).permit(:cantidad, :producto_id)
end
def destroy
  @orden = Orden.find(params[:orden_id])
  @orden_producto = @orden.orden_productos.find(params[:id])
  @orden_producto.destroy
  redirect_to orden_path(@orden), notice: "Producto eliminado correctamente."
end
private

def orden_producto_params
  params.require(:orden_producto).permit(:producto_id, :cantidad, :empleado_id)
end
end
