require 'rails_helper'

RSpec.describe "productos/index", type: :view do
  before(:each) do
    assign(:productos, [
      Producto.create!(
        nombre: "Nombre",
        precio: "Precio",
        descripcion: "Descripcion"
      ),
      Producto.create!(
        nombre: "Nombre",
        precio: "Precio",
        descripcion: "Descripcion"
      )
    ])
  end

  it "renders a list of productos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nombre".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Precio".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Descripcion".to_s), count: 2
  end
end
