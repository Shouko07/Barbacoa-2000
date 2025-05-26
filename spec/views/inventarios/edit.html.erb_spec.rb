require 'rails_helper'

RSpec.describe "inventarios/edit", type: :view do
  let(:inventario) {
    Inventario.create!(
      producto: "MyString",
      cantidad: 1,
      tipo_almacenamiento: "MyString"
    )
  }

  before(:each) do
    assign(:inventario, inventario)
  end

  it "renders the edit inventario form" do
    render

    assert_select "form[action=?][method=?]", inventario_path(inventario), "post" do
      assert_select "input[name=?]", "inventario[producto]"

      assert_select "input[name=?]", "inventario[cantidad]"

      assert_select "input[name=?]", "inventario[tipo_almacenamiento]"
    end
  end
end
