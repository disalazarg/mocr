require "../../spec_helper"

describe Mocr::Parser::Route do
  it "can be initialized with default values" do
    route = Mocr::Parser::Route.new("test")

    route.should be_a Mocr::Parser::Route
    route.path.should eq "test"
    route.url.should eq "/test"
    route.type.should eq "echo"
  end
end
