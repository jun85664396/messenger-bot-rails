class QuickReplyTemplate
    def initialize(text='')
        @template = {
                "quick_replies":[
          ]
       }
    end

    def add_postback(title = '', payload = '', image_url='', content_type = 'text')
        postback_button = {}
        postback_button['content_type'] = content_type
        postback_button['title'] = title
        postback_button['payload'] = payload
        postback_button['image_url'] = image_url
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
