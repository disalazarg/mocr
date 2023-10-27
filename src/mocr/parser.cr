require "./parser/*"

module Mocr
  module Parser
    property config : Config

    def self.parse(yaml)
      Config.from_yaml(yaml)
    end
  end
end
