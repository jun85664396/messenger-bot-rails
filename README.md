#messenger-bot
[![Build Status](https://travis-ci.org/jun85664396/messenger-bot-rails.svg?branch=master)](https://travis-ci.org/jun85664396/messenger-bot-rails)
[![Gem Version](https://badge.fury.io/rb/messenger-bot.svg)](https://badge.fury.io/rb/messenger-bot)

Ruby on Rails client!! for [Facebook Messenger Platform](https://developers.facebook.com/docs/messenger-platform)

Requires Rails >= 4

##Installation

Bundler in your Gemfile.

    gem 'messenger-bot'

##Quickstart

    #config/initializers/messenger_bot.rb
    
    Messenger::Bot.config do |config|
      config.access_token = <ACCESS_TOKEN>
      config.validation_token = <VERIFY_TOKEN>
    end
    
    #config/routes.rb
    
    mount Messenger::Bot::Space => "/webhook"
    
    
##Example

[Example](https://github.com/jun85664396/messenger-bot-rails/blob/master/example/messenger_bot_controller.rb)

    # app/controllers/messenger_bot_controller.rb
    
      class MessengerBotController < ActionController::Base
        def message(event, sender)
          # profile = sender.get_profile
          sender.reply({ text: "Reply: #{event['message']['text']}" })
        end
      
        def delivery(event, sender)
          #BlahBlah
        end
      
        def postback(event, sender)
          #BlahBlah
        end
      end

##Usage

###message(event, sender)
* `event` - Hash containing the message event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#received_message)
* `sender` - Class to call the 'reply, get_profile' method.

###delivery(event, sender)
* `event` - Hash containing the delivery event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#message_delivery)
* `sender` - Class to call the 'reply, get_profile' method.

###postback(event, sender)
* `event` - Hash containing the postback event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#postback)
* `sender` - Class to call the 'reply, get_profile' method.

![Ex](https://camo.githubusercontent.com/2452b2ca2f748f2695e545c5c14e70356df5d673/68747470733a2f2f692e696d6775722e636f6d2f59544d4f5967362e676966)

## license

MIT, see [LICENSE.txt](LICENSE.txt)
