class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      # send message to user
      sender = render_to_string(partial: "messages/sender", locals: { message: @message })
      receiver = render_to_string(partial: "messages/receiver", locals: { message: @message })
      ChatroomChannel.broadcast_to(
        @chatroom,
        sender: sender, receiver: receiver, message: @message
      )

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
