require "../spec_helper"

describe Mocr::Parser do
  it "can be initialized using a sample config file" do
    file = File.read "./spec/fixtures/sample.yaml"
    parser = Mocr::Parser.parse(file)

    parser.should be_a Mocr::Parser::Config
    parser.root.should_not be_nil
    parser.root.routes.should_not be_empty
    parser.root.routes.first.should be_a Mocr::Parser::Route
    parser.root.routes.first.url.should eq "/posts"
  end
end
