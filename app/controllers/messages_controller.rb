class MessagesController < ApplicationController
 
  def create
  	puts "Creating the message"
  	@user = current_user
    @message = Message.new(msg_params)
    @message.sent_at = DateTime.now - 8.hours
    @temp1 = @message.sender_id
    @temp2 = @message.receiver_id
    respond_to do |format|
      if @message.save
        puts "saved"
          format.js
        else
          puts "not saved"
      end
    end
  end

  private
    
    def msg_params
        params.require(:message).permit(:message, :sender_id, :receiver_id, :sent_at)
    end
end
