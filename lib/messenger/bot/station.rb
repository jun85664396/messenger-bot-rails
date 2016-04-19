module Messenger
  module Bot
    class Space::StationController < ::MessengerBotController
      def validation
        if params["hub.verify_token"] === Messenger::Bot::Config.validation_token
          return render json: params["hub.challenge"]
        end
        render body: "Error, wrong validation token"
      end

      def receive
        Messenger::Bot::Receiver.share(params)
        messaging_events = params["entry"].first["messaging"]
        messaging_events.each_with_index do |event, key|
          sender = Messenger::Bot::Transmitter.new(event["sender"]["id"])
          if event["message"] && !defined?(message).nil?
            send(:message, event, sender)
          elsif event["postback"] && !defined?(postback).nil?
            send(:postback, event, sender)
          elsif event["delivery"] && !defined?(delivery).nil?
            send(:delivery, event, sender)
          end 
        end 
        render body: "ok"
      end
    end
  end
end
