require 'rails_helper'

RSpec.describe "productos/show", type: :view do
  before(:each) do
    assign(:producto, Producto.create!(
      nombre: "Nombre",
      precio: "Precio",
      descripcion: "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Precio/)
    expect(rendered).to match(/Descripcion/)
  end
end
