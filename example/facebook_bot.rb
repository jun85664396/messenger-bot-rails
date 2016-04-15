class FacebookBot
  Facebook::Bot.on("message") do |event, sender|
    sender.reply({ text: "Reply: #{event['message']['text']}" })
  end
  Facebook::Bot.on("delivery") do |event, sender|
    #BlahBlah
  end
  Facebook::Bot.on("postback") do |event, sender|
    #BlahBlah
  end
end
