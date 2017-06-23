  class ReceiptTemplate
    def initialize(recipient_name='', order_number='', currency='', payment_method='CB/Visa', timestamp='', order_url='')
        @template = {
          'attachment': {
              'type': 'template',
              'payload': {
                  'template_type': 'receipt',
                  'recipient_name': '',
                  'order_number': '',
                  'currency': '',
                  'payment_method': ''
              }
          }
      }
        @template[:attachment][:payload]['recipient_name'] = recipient_name
        @template[:attachment][:payload]['order_number'] = order_number
        @template[:attachment][:payload]['currency'] = currency
        @template[:attachment][:payload]['payment_method'] = payment_method
        if timestamp != ''
            @template[:attachment][:payload]['timestamp'] = timestamp
        end
        if order_url != ''
            @template[:attachment][:payload]['order_url'] = order_url
        end
        @elements = []
        @address = {}
        @summary = {}
        @adjustments = []
    end
    def add_element(title='', subtitle='', quantity=-1, price=0, currency='', image_url='')
        element = {}
        element['title'] = title
        if subtitle != ''
         element['subtitle'] = subtitle
        end
        if quantity != -1
            element['quantity'] = quantity
        end
        element['price'] = price
        if currency != ''
            element['currency'] = currency
        end
        if image_url != ''
            element['image_url'] = image_url
        end
        @elements << element
    end
    def set_address(street_1='', street_2='', city='', postal_code='', state='', country='')
        @address['street_1'] = street_1
        if street_2 != ''
            @address['street_2'] = street_2
        end
        @address['city'] = city
        @address['postal_code'] = postal_code
        @address['state'] = state
        @address['country'] = country
    end
    def set_summary(subtotal=-1, shipping_cost=-1, total_tax=-1, total_cost=0)
        if subtotal != -1
            @summary[:subtotal] = subtotal
        end
        if shipping_cost != -1
            @summary[:shipping_cost] = shipping_cost
        end
        if total_tax != -1
            @summary[:total_tax] = total_tax
        end
        @summary[:total_cost] = total_cost
    end
    def add_adjustment(name='', amount=0)
        adjustment = {}
        adjustment['name'] = name
        adjustment['amount'] = amount
        @adjustments << (adjustment)
    end
    def get_message
        @template[:attachment][:payload][:elements] = @elements
        if @address != {}
            @template[:attachment][:payload][:address] = @address
        end
        @template[:attachment][:payload][:summary] = @summary
        if @adjustments != []
            @template[:attachment][:payload][:adjustments] = @adjustments
        end
        return @template
    end
  end

