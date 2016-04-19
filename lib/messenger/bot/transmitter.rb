module Messenger
  module Bot
    class Transmitter
      def initialize(sender)
        @sender_id = sender
      end

      def reply(data)
        data = {
          recipient: {
            id: @sender_id
          },
          message: data
        }
        Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}", data)
      end

      def get_profile
        Messenger::Bot::Request.get("https://graph.facebook.com/v2.6/#{@sender_id}?fields=first_name,last_name,profile_pic&access_token=#{Messenger::Bot::Config.access_token}")
      end
    end
  end
end
