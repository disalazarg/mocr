require "json"
require "yaml"

module Mocr::Parser
  class Route
    include JSON::Serializable
    include YAML::Serializable

    enum Verb
      GET
      POST
    end

    property path   : String
    property name   : String?
    property parent : Route?
    property type   : String = "echo"
    property verb   : Verb = Verb::GET
    property status : Int32 = 200
    property body   : Hash(String, String)?
    property routes : Array(Route) = [] of Route

    def initialize(
         @path   : String,
         @name   : String? = nil,
         @parent : Route?  = nil,
         @type   : String  = "echo",
         @verb   : Verb    = Verb::GET,
         @status : Int32   = 200,
         @body   : Hash(String, String) = {} of String => String,
         @routes : Array(Route) = [] of Route)

      @body ||= {} of String => String
      @name ||= @path.gsub("/", nil)
    end

    def url : String
      Path[[parent.try &.url, path]].to_s
    end
  end
end
