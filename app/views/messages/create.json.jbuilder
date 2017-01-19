if @message.save do
  json.message do
    json.name       @user.name
    json.created_at @message.created_at
    json.text       @message.text
  end
  flash[:notice] = 'メッセージ投稿に成功しました'
else
  flash[:alert] = 'メッセージを投稿できませんでした'
  render :new_group_message
end
