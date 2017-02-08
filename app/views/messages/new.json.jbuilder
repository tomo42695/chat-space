json.array! @messages do |message|
  json.text message.text
  json.image message.image.url
  json.created_at message.created_at
  json.name message.user.name
end
