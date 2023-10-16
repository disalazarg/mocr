require "../spec_helper"

describe Mocr::Parser do
  it "can be initialized using a sample config file" do
    file = File.read "./spec/fixtures/sample.yaml"
    parser = Mocr::Parser.parse(file)

    parser.should be_a Mocr::Parser::Config
    parser.root.should_not be_nil
  end
end
