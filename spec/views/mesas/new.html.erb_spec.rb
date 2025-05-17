require 'rails_helper'

RSpec.describe "mesas/new", type: :view do
  before(:each) do
    assign(:mesa, Mesa.new(
      numero: 1,
      disponibilidad: "MyString",
      capacidad: 1
    ))
  end

  it "renders new mesa form" do
    render

    assert_select "form[action=?][method=?]", mesas_path, "post" do

      assert_select "input[name=?]", "mesa[numero]"

      assert_select "input[name=?]", "mesa[disponibilidad]"

      assert_select "input[name=?]", "mesa[capacidad]"
    end
  end
end
