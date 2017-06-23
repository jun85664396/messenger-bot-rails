class ListTemplate
  def initialize(sharable = false, top_element_style = 'large')
     @template = {
                    'attachment': {
                        'type': 'template',
                        'sharable': sharable,
                        'top_element_style': top_element_style,
                        'payload': {
                            'template_type': 'list',
                            'elements': [],
                            'buttons': []
                        }
                    }
                }
        @elements = []
        @buttons = []
  end

  def add_element(title = '', subtitle = '', image_url = '', buttons = [])
      element = {}
      element['title'] = title
      element['subtitle'] = subtitle
      element['image_url'] = image_url
      unless buttons.empty?
        element['buttons'] = buttons
      end
      @elements << element
  end

  def get_message
    @template[:attachment][:payload][:elements] = @elements
    return @template
  end

end
