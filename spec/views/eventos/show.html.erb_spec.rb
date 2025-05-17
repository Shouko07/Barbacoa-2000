require 'rails_helper'

RSpec.describe "eventos/show", type: :view do
  before(:each) do
    assign(:evento, Evento.create!(
      nombre: "Nombre",
      descripcion: "Descripcion",
      ubicacion: "Ubicacion",
      tipo: "Tipo",
      estado: "Estado",
      cantidad_pagada: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/Ubicacion/)
    expect(rendered).to match(/Tipo/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/2/)
  end
end
