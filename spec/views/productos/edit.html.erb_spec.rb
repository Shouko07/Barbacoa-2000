require 'rails_helper'

RSpec.describe "productos/edit", type: :view do
  let(:producto) {
    Producto.create!(
      nombre: "MyString",
      precio: "MyString",
      descripcion: "MyString"
    )
  }

  before(:each) do
    assign(:producto, producto)
  end

  it "renders the edit producto form" do
    render

    assert_select "form[action=?][method=?]", producto_path(producto), "post" do
      assert_select "input[name=?]", "producto[nombre]"

      assert_select "input[name=?]", "producto[precio]"

      assert_select "input[name=?]", "producto[descripcion]"
    end
  end
end
