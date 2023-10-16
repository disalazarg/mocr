require "json"
require "yaml"

module Mocr::Parser
  class Config
    include JSON::Serializable
    include YAML::Serializable

    property port : Int32 = 3000
    property vars : Hash(String, String) = {} of String => String
    property root : Route

    def initialize
      @root = Route.new("/")
    end
  end
end
