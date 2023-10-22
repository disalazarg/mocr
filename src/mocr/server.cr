require "kemal"

module Mocr
  class Server
    alias Verb = Parser::Route::Verb

    def initialize(config : Parser::Config)
      parse_route(config.root)
    end

    def run(port : Int32 = 3000)
      Kemal.run port
    end

    private def parse_route(route : Parser::Route) : Nil
      case route.verb
      when Verb::GET
        get route.url do |ctx| craft_response(ctx, route) end
      when Verb::POST
        post route.url do |ctx| craft_response(ctx, route) end
      end

      route.routes.each do |r| parse_route(r) end
    end

    private def craft_response(ctx, route : Parser::Route)
      ctx.response.status_code = route.status
      route.type == "echo" && ctx.request.body ? ctx.request.body : route.body.to_json
    end
  end
end
