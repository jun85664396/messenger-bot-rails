module Messenger
  module Bot
    class Transmitter
      def initialize(sender)
        @sender_id = sender
      end

      def reply(data)
        data = init_data.merge({ message: data })
        Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}", data)
      end

      def get_profile(fields=nil)
        fields ||= [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
        Messenger::Bot::Request.get("https://graph.facebook.com/v2.6/#{@sender_id}?fields=#{fields.join(",")}&access_token=#{Messenger::Bot::Config.access_token}")
      end

      def action(sender_action=true)
        data = init_data.merge({ sender_action: sender_action ? "typing_on" : "typing_off" })
        Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}", data)
      end

      private

      def init_data
        {
          recipient: {
            id: @sender_id
          }
        }
      end
    end
  end
end
