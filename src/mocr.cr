require "./mocr/*"
require "option_parser"

module Mocr
  VERSION = "0.1.1"

  file = "./spec/fixtures/sample.yaml"
  OptionParser.parse do |parser|
    parser.banner = "Usage: mocr -f config.yaml"
    parser.on "-f FILE", "--file FILE", "YAML config file" { |f| file = f }
  end

  yaml = File.read file
  config = Mocr::Parser.parse(yaml)

  Server.new(config).run
end
