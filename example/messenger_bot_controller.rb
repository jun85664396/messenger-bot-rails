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

