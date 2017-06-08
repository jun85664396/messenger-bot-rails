class ListTemplate
  def initialize()
     @template = {
                    'attachment': {
                        'type': 'template',
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

end
