require 'rails_helper'

RSpec.describe "ordens/edit", type: :view do
  let(:orden) {
    Orden.create!(
      numero_personas: 1,
      total: 1,
      mesa: nil,
      empleado: nil
    )
  }

  before(:each) do
    assign(:orden, orden)
  end

  it "renders the edit orden form" do
    render

    assert_select "form[action=?][method=?]", orden_path(orden), "post" do
      assert_select "input[name=?]", "orden[numero_personas]"

      assert_select "input[name=?]", "orden[total]"

      assert_select "input[name=?]", "orden[mesa_id]"

      assert_select "input[name=?]", "orden[empleado_id]"
    end
  end
end
