class MessagesController < ApplicationController
  def new
    @message = Message.new
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to :new_group_message }
        format.json { render json: {
          name:       @message.user.name,
          created_at: @message.created_at,
          text:       @message.text
          } }
      end
      flash[:notice] = 'メッセージ投稿に成功しました'
    else
      flash[:alert] = 'メッセージを投稿できませんでした'
      render :new_group_message
    end
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
