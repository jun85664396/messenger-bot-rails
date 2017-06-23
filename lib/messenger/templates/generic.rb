
class GenericTemplate
  def initialize(sharable = false, image_aspect_ratio = 'horizontal')
      @template = {
                  'attachment': {
                      'type': 'template',
                      'payload': {
                          'template_type': 'generic',
                          'sharable': sharable,
                          'image_aspect_ratio': image_aspect_ratio,
                          'elements': []
                      }
                  }
              }
      @elements = []
  end

  def add_element(title = '', item_url = '', image_url = '', subtitle = '', buttons = [])
      element = {}
      element['title'] = title
      element['item_url'] = item_url
      element['image_url'] = image_url
      element['subtitle'] = subtitle
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
