module Facebook
  module Bot
    class Space::StationController < ::ApplicationController
      def validation
        if params["hub.verify_token"] === Facebook::Bot::Config.verify_token
          return render json: params["hub.challenge"]
        end
        render body: "Error, wrong validation token"
      end

      def receive
        Facebook::Bot::Receiver.share(params)
        render body: "ok"
      end
    end
  end
end
