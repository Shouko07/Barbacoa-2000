require 'rails_helper'

RSpec.describe "inventarios/index", type: :view do
  before(:each) do
    assign(:inventarios, [
      Inventario.create!(
        producto: "Producto",
        cantidad: 2,
        tipo_almacenamiento: "Tipo Almacenamiento"
      ),
      Inventario.create!(
        producto: "Producto",
        cantidad: 2,
        tipo_almacenamiento: "Tipo Almacenamiento"
      )
    ])
  end

  it "renders a list of inventarios" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Producto".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tipo Almacenamiento".to_s), count: 2
  end
end
