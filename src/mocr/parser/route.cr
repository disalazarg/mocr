require "json"
require "yaml"

module Mocr::Parser
  class Route
    include JSON::Serializable
    include YAML::Serializable

    property path   : String
    property name   : String?
    property parent : Route?
    property type   : String
    property body   : Hash(String, String)?
    property sub    : Array(Route) = [] of Route

    def initialize(@path : String, @name = nil, @parent = nil, @type = "echo", @body = nil, @sub = [] of Route)
      @name ||= @path.gsub("/", nil)
    end

    def url
      "/" + path
    end
  end
end
