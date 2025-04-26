# spec/models/empleado_spec.rb
require 'rails_helper'

RSpec.describe Empleado, type: :model do
  let(:valido) do
    {
      nombre: "Ana",
      apellido_paterno: "Gómez",
      apellido_materno: "López",
      puesto: "Recepcionista",
      horario: "9:00 - 17:00",
      rfc: "GOLA900101ABC",
      telefono: "6641234567",
      edad: 25,
      fecha_contratacion: Date.today
    }
  end

  it 'es válido con todos los campos correctos' do
    expect(Empleado.new(valido)).to be_valid
  end

  it 'es inválido sin nombre' do
    datos = valido.merge(nombre: nil)
    expect(Empleado.new(datos)).not_to be_valid
  end

  it 'es inválido si el RFC no tiene 13 caracteres' do
    datos = valido.merge(rfc: "ABC123")
    expect(Empleado.new(datos)).not_to be_valid
  end

  it 'es inválido si el teléfono no tiene 10 dígitos' do
    datos = valido.merge(telefono: "1234")
    expect(Empleado.new(datos)).not_to be_valid
  end

  it 'es inválido si la edad es menor a 18 años' do
    datos = valido.merge(edad: 17)
    expect(Empleado.new(datos)).not_to be_valid
  end
end
