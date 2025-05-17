require 'rails_helper'

RSpec.describe "inventarios/show", type: :view do
  before(:each) do
    assign(:inventario, Inventario.create!(
      producto: "Producto",
      cantidad: 2,
      tipo_almacenamiento: "Tipo Almacenamiento"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Producto/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Tipo Almacenamiento/)
  end
end
