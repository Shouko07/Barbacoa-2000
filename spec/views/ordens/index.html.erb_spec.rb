require 'rails_helper'

RSpec.describe "ordens/index", type: :view do
  before(:each) do
    assign(:ordens, [
      Orden.create!(
        numero_personas: 2,
        total: 3,
        mesa: nil,
        empleado: nil
      ),
      Orden.create!(
        numero_personas: 2,
        total: 3,
        mesa: nil,
        empleado: nil
      )
    ])
  end

  it "renders a list of ordens" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
