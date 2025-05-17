require 'rails_helper'

RSpec.describe "mesas/index", type: :view do
  before(:each) do
    assign(:mesas, [
      Mesa.create!(
        numero: 2,
        disponibilidad: "Disponibilidad",
        capacidad: 3
      ),
      Mesa.create!(
        numero: 2,
        disponibilidad: "Disponibilidad",
        capacidad: 3
      )
    ])
  end

  it "renders a list of mesas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Disponibilidad".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
