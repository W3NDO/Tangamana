require "rails_helper"

RSpec.describe TavernsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/taverns").to route_to("taverns#index")
    end

    it "routes to #new" do
      expect(get: "/taverns/new").to route_to("taverns#new")
    end

    it "routes to #show" do
      expect(get: "/taverns/1").to route_to("taverns#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/taverns/1/edit").to route_to("taverns#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/taverns").to route_to("taverns#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/taverns/1").to route_to("taverns#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/taverns/1").to route_to("taverns#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/taverns/1").to route_to("taverns#destroy", id: "1")
    end
  end
end
