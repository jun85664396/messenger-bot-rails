#messenger-bot
[![Build Status](https://travis-ci.org/jun85664396/messenger-bot-rails.svg?branch=master)](https://travis-ci.org/jun85664396/messenger-bot-rails)
[![Gem Version](https://badge.fury.io/rb/messenger-bot.svg)](https://badge.fury.io/rb/messenger-bot)

Ruby on Rails client!! for [Facebook Messenger Platform](https://developers.facebook.com/docs/messenger-platform)

Requires Rails >= 4.2.0

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

[Example](https://github.com/jun85664396/messenger-bot/blob/master/example/messenger_bot_controller.rb)

    # app/controllers/application_controller.rb
    
      Messenger::Bot.on("message") do |event, sender|
        sender.reply({ text: "Reply: #{event['message']['text']}" })
      end
      Messenger::Bot.on("delivery") do |event, sender|
        #BlahBlah
      end
      Messenger::Bot.on("postback") do |event, sender|
        #BlahBlah
      end
    
![Ex](https://camo.githubusercontent.com/2452b2ca2f748f2695e545c5c14e70356df5d673/68747470733a2f2f692e696d6775722e636f6d2f59544d4f5967362e676966)

## license

MIT, see [LICENSE.txt](LICENSE.txt)
