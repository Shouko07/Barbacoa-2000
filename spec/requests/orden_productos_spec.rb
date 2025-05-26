require 'rails_helper'

RSpec.describe "OrdenProductos", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/orden_productos/create"
      expect(response).to have_http_status(:success)
    end
  end

end
