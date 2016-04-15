require "facebook/bot/version"
require "facebook/bot/config"
require "facebook/bot/transmitter"
require "facebook/bot/receiver"

module Facebook
  module Bot
    def self.config(&block)
      if block_given?
        block.call(Facebook::Bot::Config)
      else
        Facebook::Bot::Config
      end
    end

    def self.on(event, &block)
      if %w(message postback delivery).include?(event)
        if block_given?
          Facebook::Bot::Receiver.define_event(event, &block)
        end
      else
        raise "'#{event}' Not support event."
      end
    end

    autoload :Space, "facebook/bot/space"

  end
end
