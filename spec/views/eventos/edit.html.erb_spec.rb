require 'rails_helper'

RSpec.describe "eventos/edit", type: :view do
  let(:evento) {
    Evento.create!(
      nombre: "MyString",
      descripcion: "MyString",
      ubicacion: "MyString",
      tipo: "MyString",
      estado: "MyString",
      cantidad_pagada: 1
    )
  }

  before(:each) do
    assign(:evento, evento)
  end

  it "renders the edit evento form" do
    render

    assert_select "form[action=?][method=?]", evento_path(evento), "post" do

      assert_select "input[name=?]", "evento[nombre]"

      assert_select "input[name=?]", "evento[descripcion]"

      assert_select "input[name=?]", "evento[ubicacion]"

      assert_select "input[name=?]", "evento[tipo]"

      assert_select "input[name=?]", "evento[estado]"

      assert_select "input[name=?]", "evento[cantidad_pagada]"
    end
  end
end
