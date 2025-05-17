require 'rails_helper'

RSpec.describe "eventos/new", type: :view do
  before(:each) do
    assign(:evento, Evento.new(
      nombre: "MyString",
      descripcion: "MyString",
      ubicacion: "MyString",
      tipo: "MyString",
      estado: "MyString",
      cantidad_pagada: 1
    ))
  end

  it "renders new evento form" do
    render

    assert_select "form[action=?][method=?]", eventos_path, "post" do

      assert_select "input[name=?]", "evento[nombre]"

      assert_select "input[name=?]", "evento[descripcion]"

      assert_select "input[name=?]", "evento[ubicacion]"

      assert_select "input[name=?]", "evento[tipo]"

      assert_select "input[name=?]", "evento[estado]"

      assert_select "input[name=?]", "evento[cantidad_pagada]"
    end
  end
end
