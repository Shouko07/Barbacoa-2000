require 'rails_helper'

RSpec.describe "mesas/show", type: :view do
  before(:each) do
    assign(:mesa, Mesa.create!(
      numero: 2,
      disponibilidad: "Disponibilidad",
      capacidad: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Disponibilidad/)
    expect(rendered).to match(/3/)
  end
end
