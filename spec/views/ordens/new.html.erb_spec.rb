require 'rails_helper'

RSpec.describe "ordens/new", type: :view do
  before(:each) do
    assign(:orden, Orden.new(
      numero_personas: 1,
      total: 1,
      mesa: nil,
      empleado: nil
    ))
  end

  it "renders new orden form" do
    render

    assert_select "form[action=?][method=?]", ordens_path, "post" do

      assert_select "input[name=?]", "orden[numero_personas]"

      assert_select "input[name=?]", "orden[total]"

      assert_select "input[name=?]", "orden[mesa_id]"

      assert_select "input[name=?]", "orden[empleado_id]"
    end
  end
end
