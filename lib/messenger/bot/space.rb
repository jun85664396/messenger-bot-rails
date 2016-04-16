module Messenger
  module Bot
    class Space < ::Rails::Engine
      isolate_namespace Space
      autoload :StationController, "messenger/bot/station"
      Space.routes.draw do
        get "/", to: "station#validation"
        post "/", to: "station#receive"
      end 
    end
  end
end
