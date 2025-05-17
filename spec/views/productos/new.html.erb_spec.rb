require 'rails_helper'

RSpec.describe "productos/new", type: :view do
  before(:each) do
    assign(:producto, Producto.new(
      nombre: "MyString",
      precio: "MyString",
      descripcion: "MyString"
    ))
  end

  it "renders new producto form" do
    render

    assert_select "form[action=?][method=?]", productos_path, "post" do

      assert_select "input[name=?]", "producto[nombre]"

      assert_select "input[name=?]", "producto[precio]"

      assert_select "input[name=?]", "producto[descripcion]"
    end
  end
end
