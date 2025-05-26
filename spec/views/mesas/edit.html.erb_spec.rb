require 'rails_helper'

RSpec.describe "mesas/edit", type: :view do
  let(:mesa) {
    Mesa.create!(
      numero: 1,
      disponibilidad: "MyString",
      capacidad: 1
    )
  }

  before(:each) do
    assign(:mesa, mesa)
  end

  it "renders the edit mesa form" do
    render

    assert_select "form[action=?][method=?]", mesa_path(mesa), "post" do
      assert_select "input[name=?]", "mesa[numero]"

      assert_select "input[name=?]", "mesa[disponibilidad]"

      assert_select "input[name=?]", "mesa[capacidad]"
    end
  end
end
