require "rails_helper"

RSpec.describe InventariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/inventarios").to route_to("inventarios#index")
    end

    it "routes to #new" do
      expect(get: "/inventarios/new").to route_to("inventarios#new")
    end

    it "routes to #show" do
      expect(get: "/inventarios/1").to route_to("inventarios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/inventarios/1/edit").to route_to("inventarios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/inventarios").to route_to("inventarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/inventarios/1").to route_to("inventarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/inventarios/1").to route_to("inventarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/inventarios/1").to route_to("inventarios#destroy", id: "1")
    end
  end
end
