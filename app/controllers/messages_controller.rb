class MessagesController < ApplicationController
  def new
    @message = Message.new
    @group = Group.find(params[:group_id])
    @messages = @group.messages.order('created_at desc')
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'メッセージ投稿に成功しました'
    else
      flash[:alert] = 'メッセージを投稿できませんでした'
    end
    redirect_to new_group_message_path
  end

  private

  def message_params
    params.require(:message).permit(
      :text,
      :image
    ).merge(
      user_id: current_user.id,
      group_id: params[:group_id])
  end
end
