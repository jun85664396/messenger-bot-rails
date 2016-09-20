
    class ButtonTemplate
        def initialize(text='')
            @template = {
                      'attachment': {
                          'type': 'template',
                          'payload': {
                               'template_type': 'button',
                                'text': '',
                                'buttons': []
                          }
                      }
                  }
        end
        def add_web_url(title='', url='')
            web_url_button = {}
            web_url_button['type'] = 'web_url'
            web_url_button['title'] = title
            web_url_button['url'] = url
            @template[:attachment][:payload][:buttons] << (web_url_button)
        end

        def add_postback(title='', payload='')
            postback_button = {}
            postback_button['type'] = 'postback'
            postback_button['title'] = title
            postback_button['payload'] = payload
            @template[:attachment][:payload][:buttons] << (postback_button)
        end

        def set_text(text='')
            @text = text
        end

        def get_message
            @template[:attachment][:payload][:text] = @text
            return @template
        end
    end


    class Button
        def initialize(text='')
          @template = {}
        end

        def add_web_url(title='', url='')
          @template['type'] = 'web_url'
          @template['title'] = title
          @template['url'] = url
        end

        def add_postback(title='', payload='')
          @template['type'] = 'postback'
          @template['title'] = title
          @template['payload'] = payload
        end

        # def set_text(text='')
        #   @text = text
        # end

        def get_message
          return @template
        end
    end


