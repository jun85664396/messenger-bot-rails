module Messenger
  module Bot
    class Request
      def self.post(url, data)
        url = URI.parse(url)
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

      def self.get(url, data = {})
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, 443)
        http.use_ssl = true
        begin
          request = Net::HTTP::Get.new(url.request_uri)
          request["Content-Type"] = "application/json"
          response = http.request(request)
          body = JSON(response.body)
          return { ret: body["error"].nil?, body: body }
        rescue => e
          raise e 
        end
      end

      def self.delete(url, data)
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, 443)
        http.use_ssl = true
        begin
          request = Net::HTTP::Delete.new(url.request_uri)
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
