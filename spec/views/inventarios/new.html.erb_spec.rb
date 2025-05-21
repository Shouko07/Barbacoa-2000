require 'rails_helper'

RSpec.describe "inventarios/new", type: :view do
  before(:each) do
    assign(:inventario, Inventario.new(
      producto: "MyString",
      cantidad: 1,
      tipo_almacenamiento: "MyString"
    ))
  end

  it "renders new inventario form" do
    render

    assert_select "form[action=?][method=?]", inventarios_path, "post" do
      assert_select "input[name=?]", "inventario[producto]"

      assert_select "input[name=?]", "inventario[cantidad]"

      assert_select "input[name=?]", "inventario[tipo_almacenamiento]"
    end
  end
end
