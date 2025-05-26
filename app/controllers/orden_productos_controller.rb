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
end
