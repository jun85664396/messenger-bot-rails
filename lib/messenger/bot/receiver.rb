module Messenger
  module Bot
    class Receiver
      def self.share(data)
        messaging_events = data["entry"].first["messaging"]
        messaging_events.each_with_index do |event, key|
          if event["message"]
            self.class.send(:message, event)
          elsif event["postback"]
            self.class.send(:postback, event)
          elsif event["delivery"]
            self.class.send(:delivery, event)
          end 
        end 
      end

      def self.define_event(event, &block)
        self.class.instance_eval do
          define_method(event.to_sym) do |event|
            yield(event, Messenger::Bot::Transmitter.new(event["sender"]["id"]))
          end
        end
      end
    end
  end
end
