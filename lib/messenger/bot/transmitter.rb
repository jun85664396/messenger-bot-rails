module Messenger
  module Bot
    class Transmitter
      def initialize(sender, on_facebook)
        p "INIT"
        p on_facebook
        @sender_id = sender
        @on_facebook = on_facebook
      end

      def reply(data)
        p "REPLY"
        data = init_data.merge({ message: data })
        p "FACEBOOK REPLY"
        p @on_facebook
        if (@on_facebook.nil?) || (@on_facebook == true)
          p "ON FACEBOOK"
          Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}", data, true)
        else
           p "NOT ON FACEBOOK"
          Messenger::Bot::Request.post("http://perceptron-app.herokuapp.com/receive_message", data, false)
        end
      end

      def get_profile(fields=nil)
        fields ||= [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
        Messenger::Bot::Request.get("https://graph.facebook.com/v2.6/#{@sender_id}?fields=#{fields.join(",")}&access_token=#{Messenger::Bot::Config.access_token}")
      end

      def action(sender_action=true)
        data = init_data.merge({ sender_action: sender_action ? "typing_on" : "typing_off" })
        Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}", data, true)
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
