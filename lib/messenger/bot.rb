require "messenger/bot/version"
require "messenger/bot/config"
require "messenger/bot/request"
require "messenger/bot/transmitter"
require "messenger/bot/receiver"

module Messenger
  module Bot
    def self.config(&block)
      if block_given?
        block.call(Messenger::Bot::Config)
      else
        Messenger::Bot::Config
      end
    end

    def self.on(event, &block)
      if %w(message postback delivery).include?(event)
        if block_given?
          Messenger::Bot::Receiver.define_event(event, &block)
        end
      else
        raise "'#{event}' Not support event."
      end
    end

    autoload :Space, "messenger/bot/space"
    autoload :Thread, "messenger/bot/thread"
  end
end
