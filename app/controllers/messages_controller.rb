class MessagesController < ApplicationController
  def new
    @message = Message.new
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    @user = @message.user
    @error = @message.errors.full_messages[0]
    render :new_group_message, json: [@message, @user, @error]
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
