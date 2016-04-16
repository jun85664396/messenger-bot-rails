class MessengerBotController < ActionController::Base
  Messenger::Bot.on("message") do |event, sender|
    sender.reply({ text: "Reply: #{event['message']['text']}" })
  end
  Messenger::Bot.on("delivery") do |event, sender|
  end
  Messenger::Bot.on("postback") do |event, sender|
    #BlahBlah
  end
end

