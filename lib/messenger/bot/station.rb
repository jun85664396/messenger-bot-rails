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
        render body: "ok"
      end
    end
  end
end
