class MessagesController < ApplicationController
  def index
    @user = current_user
    if @user != nil
      @recipient = User.where.not(id: @user.id).first
      @messages = Message.having("user_id = #{@user.id}").or(Message.having("recipient_id = #{@user.id}")).group(:id)
    end
    @message = Message.new
  end

  def create
    message = current_user.messages.new(message_params)
    if message.save
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong, your message was not sent.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id)
  end
end
