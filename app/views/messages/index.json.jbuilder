json.messages @group.messages.each do |message|
  json.name     message.user.name
  json.body     message.body
  json.image    message.image
  json.id       message.id
  json.time     message.created_at.strftime("%Y/%m/%d %H:%M:%S")
end
