if @message.save do
  json.message do
    json.name       @user.name
    json.created_at @message.created_at
    json.text       @message.text
    json.error      @error
  end
end
