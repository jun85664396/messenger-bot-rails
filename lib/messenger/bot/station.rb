module Messenger
  module Bot
    class Space::StationController < ::MessengerBotController
      before_action :authenticate, only: [:receive]

      def validation
        if params["hub.verify_token"] === Messenger::Bot::Config.validation_token
          return render json: params["hub.challenge"]
        end
        render body: "Error, wrong validation token"
      end

      def receive
        Messenger::Bot::Receiver.share(params)
        params["entry"].each do |entry|
          messaging_events = entry["messaging"]
          messaging_events.each_with_index do |event, key|
            sender = Messenger::Bot::Transmitter.new(event["sender"]["id"])
            if event["message"] && !defined?(message).nil? && event["message"]["quick_reply"].nil?
              send(:message, event, sender)
            elsif (event["postback"] && !defined?(postback).nil?) || (event["message"] && event["message"]["quick_reply"].present?)
              if event["message"].present?
                event["postback"] = event["message"]["quick_reply"]
                send(:postback, event, sender)
              else
                send(:postback, event, sender)
              end
            elsif event["delivery"] && !defined?(delivery).nil?
              send(:delivery, event, sender)
            elsif event["optin"]
              send(:optin, event, sender)
            end
          end
        end
        render body: "ok"
      end

      def authenticate
        return true if Messenger::Bot::Config.secret_token.nil?
        signature = "sha1=" + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), Messenger::Bot::Config.secret_token, request.body.read)
        return render(body: "Error, Signatures didn't match", status: 500) unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
      end
    end
  end
end
