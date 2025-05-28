class Empleados::RegistrationsController < Devise::RegistrationsController
  protected

  # Evita el login automático después del registro
  def sign_up(resource_name, resource)
    # No hagas nada aquí
  end

  # Redirige a la página de registro después de crear el empleado
  def after_sign_up_path_for(resource)
    new_empleado_registration_path
  end

  # Cambia el mensaje flash después del registro
  def set_flash_message!(key, kind, options = {})
    if key == :notice && kind == :signed_up
      flash[key] = "Empleado creado exitosamente"
    else
      super
    end
  end
end
