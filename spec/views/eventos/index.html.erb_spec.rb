require 'rails_helper'

RSpec.describe "eventos/index", type: :view do
  before(:each) do
    assign(:eventos, [
      Evento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        ubicacion: "Ubicacion",
        tipo: "Tipo",
        estado: "Estado",
        cantidad_pagada: 2
      ),
      Evento.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        ubicacion: "Ubicacion",
        tipo: "Tipo",
        estado: "Estado",
        cantidad_pagada: 2
      )
    ])
  end

  it "renders a list of eventos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nombre".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Descripcion".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ubicacion".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tipo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Estado".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
