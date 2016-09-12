module Messenger
  module Bot
    class Receiver
      def self.share(data)
        #data = eval(data)`
        if data[:entry]["0"].present?
          p data[:entry]
          data[:entry] = [data[:entry]["0"]]
          p "YEYE"
          p data
          arr = []
          arr << data[:entry].first[:messaging]["0"]
          p "ARR"
          p arr
          data[:entry].first[:messaging] = arr
          p "YO"
          p data
          p "messaging"
          p data["entry"].first["messaging"]
        end
        messaging_events = data["entry"].first["messaging"]
        messaging_events.each_with_index do |event, key|
          if event["message"] && !defined?(message).nil?
            self.class.send(:message, event)
          elsif event["postback"] && !defined?(postback).nil?
            self.class.send(:postback, event)
          elsif event["delivery"] && !defined?(delivery).nil?
            self.class.send(:delivery, event)
          end
        end
      end

      def self.define_event(event, &block)
        self.class.instance_eval do
          define_method(event.to_sym) do |event|
            yield(event, Messenger::Bot::Transmitter.new(event["sender"]["id"], event["sender"]["on_facebook"]))
          end
        end
      end
    end
  end
end
