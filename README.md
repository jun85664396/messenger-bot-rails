# messenger-bot
[![Build Status](https://travis-ci.org/jun85664396/messenger-bot-rails.svg?branch=master)](https://travis-ci.org/jun85664396/messenger-bot-rails)
[![Gem Version](https://badge.fury.io/rb/messenger-bot.svg)](https://badge.fury.io/rb/messenger-bot)

Ruby on Rails client!! for [Facebook Messenger Platform](https://developers.facebook.com/docs/messenger-platform)

Requires Rails >= 4

## Installation

Bundler in your Gemfile.

```ruby
gem 'messenger-bot'
```

## Getting Started

#### Before You Begin
  Now sign in into the [Facebook developer](https://developers.facebook.com/apps) and create an application

1. Add `messenger-bot-rails` to your Gemfile
  ```ruby
  gem 'messenger-bot'
  ```

2. Set config in `config/initializers/messenger_bot.rb `
  ```ruby
  Messenger::Bot.config do |config|
    config.access_token = <PAGE_ACCESS_TOKEN>
    config.validation_token = <VERIFY_TOKEN>
    config.secret_token = <FB_APP_SECRET_TOKEN>
  end
  ```
  [Subscribe the App to the Page](https://developers.facebook.com/docs/messenger-platform/quickstart#subscribe_app_page)
  
3. Add the following to your `config/routes.rb`
  ```ruby
  mount Messenger::Bot::Space => "/webhook"
  ```
4. create a controller in `app/controllers/messenger_bot_controller.rb`
  ```ruby
  class MessengerBotController < ActionController::Base
    def message(event, sender)
      # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
      sender.reply({ text: "Reply: #{event['message']['text']}" })
    end
  
    def delivery(event, sender)
    end
  
    def postback(event, sender)
      payload = event["postback"]["payload"]
      case payload
      when :something
        #ex) process sender.reply({text: "button click event!"})
      end
    end
  end
  ```

[wiki](https://github.com/jun85664396/messenger-bot-rails/wiki/Getting-Started)

## Usage

### message(event, sender)
* `event` - Hash containing the message event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#received_message)
* `sender` - Class to call the 'reply, get_profile' method.

### delivery(event, sender)
* `event` - Hash containing the delivery event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#message_delivery)
* `sender` - Class to call the 'reply, get_profile' method.

### postback(event, sender)
* `event` - Hash containing the postback event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#postback)
* `sender` - Class to call the 'reply, get_profile' method.

### optin(event, sender)
* `event` - Hash containing the optin event from Facebook [format](https://developers.facebook.com/docs/messenger-platform/webhook-reference#postback)
* `sender` - Class to call the 'reply, get_profile' method.


## license

MIT, see [LICENSE.txt](LICENSE.txt)
