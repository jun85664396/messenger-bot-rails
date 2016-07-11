module Messenger
  module Bot
    class Thread
      def set(data)
        Messenger::Bot::Request.post("https://graph.facebook.com/v2.6/me/thread_settings?access_token=#{Messenger::Bot::Config.access_token}", data)
      end

      def unset(data)
        Messenger::Bot::Request.delete("https://graph.facebook.com/v2.6/me/thread_settings?access_token=#{Messenger::Bot::Config.access_token}", data)
      end
    end
  end
end
