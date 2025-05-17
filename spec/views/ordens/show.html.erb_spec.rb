require 'rails_helper'

RSpec.describe "ordens/show", type: :view do
  before(:each) do
    assign(:orden, Orden.create!(
      numero_personas: 2,
      total: 3,
      mesa: nil,
      empleado: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
