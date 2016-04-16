module Messenger
  module Bot
    class Transmitter
      def initialize(sender)
        @data = {
          recipient: { id: sender }
        }
      end

      def reply(data)
        @data[:message] = data
        send_message(@data)
      end

      private

      def send_message(data)
        url = URI.parse("https://graph.facebook.com/v2.6/me/messages?access_token=#{Messenger::Bot::Config.access_token}")
        http = Net::HTTP.new(url.host, 443)
        http.use_ssl = true
        begin
          request = Net::HTTP::Post.new(url.request_uri)
          request["Content-Type"] = "application/json"
          request.body = data.to_json
          response = http.request(request)
          body = JSON(response.body)
          return { ret: body["error"].nil?, body: body }
        rescue => e
          raise e 
        end
      end
    end
  end
end
