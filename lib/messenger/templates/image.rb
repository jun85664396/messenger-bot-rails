class ImageTemplate
    def initialize(url='')
        @template = { 'attachment': {
                            'type': 'image',
                            'payload': {
                                'url': ''
                            }
                        }
                    }
        @url = url
    end

    def set_url(url='')
        @url = url
    end

    def get_message
        @template[:attachment][:payload][:url] = @url
        return @template
    end
end
