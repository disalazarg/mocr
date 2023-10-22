require "./mocr/*"

# TODO: Write documentation for `Mocr`
module Mocr
  VERSION = "0.1.1"

  file = File.read "./spec/fixtures/sample.yaml"
  config = Mocr::Parser.parse(file)
  Server.new(config).run
end
