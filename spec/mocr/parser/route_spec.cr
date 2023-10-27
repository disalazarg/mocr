require "../../spec_helper"

module Mocr::Parser
  describe Route do
    it "can be initialized with default values" do
      route = Route.new("test")

      route.should be_a Route
      route.path.should eq "test"
      route.url.should eq "/test"
      route.type.should eq "echo"
      route.verb.should eq Route::Verb::GET
    end

    it "can take additional arguments in a hash" do
      route = Route.new("test", status: 201, type: "body", body: { "status" => "OK" })

      route.should be_a Route
      route.path.should eq "test"
      route.url.should eq "/test"
      route.type.should eq "body"
      route.body.should eq({ "status" => "OK" })
      route.verb.should eq Route::Verb::GET
    end
  end
end
