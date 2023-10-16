require "kemal"

module Mocr
  class Server
    def initialize
      get "/*" do
        "{\"hello\":\"world\"}"
      end
    end

    def run(port : Int32 = 3000)
      Kemal.run port
    end
  end
end
