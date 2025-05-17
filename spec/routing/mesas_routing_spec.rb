require "rails_helper"

RSpec.describe MesasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mesas").to route_to("mesas#index")
    end

    it "routes to #new" do
      expect(get: "/mesas/new").to route_to("mesas#new")
    end

    it "routes to #show" do
      expect(get: "/mesas/1").to route_to("mesas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mesas/1/edit").to route_to("mesas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mesas").to route_to("mesas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mesas/1").to route_to("mesas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mesas/1").to route_to("mesas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mesas/1").to route_to("mesas#destroy", id: "1")
    end
  end
end
