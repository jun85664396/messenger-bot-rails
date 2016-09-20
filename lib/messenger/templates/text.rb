class TextTemplate
  @template = {
    'template_type': 'text',
    'value': {
        text: ''
    }
  }
    def initialize(text='', post_text='')
        @template = {
                      'text': ''
                    }
        @text = text
        @post_text = post_text
    end

    def set_text(text='')
        @text = text
    end

    def set_post_text(post_text='')
        @post_text = post_text
    end

    def get_message
        @template['text'] = @text + @post_text
        return @template
    end
end
