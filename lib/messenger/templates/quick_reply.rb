module Messenger
  class QuickReplyTemplate
      def initialize(text='')
          @template = {
                  "quick_replies":[
            ]
         }
      end

      def add_postback(title='', payload='')
          postback_button = {}
          postback_button['content_type'] = 'text'
          postback_button['title'] = title
          postback_button['payload'] = payload
          p @template
          @template[:quick_replies] << (postback_button)
      end

      def set_text(text='')
        @text = text
      end

      def get_message
        @template["text"] = @text
        return @template
      end
  end
end
