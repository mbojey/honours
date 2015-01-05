class LayoutsController < ApplicationController

	def privatechat
	   	@user = current_user
	   	if params[:id1]<params[:id2]		#the convention will be to have the lesser number come first in the path and the channel
	    	@id1 = params[:id1].to_i
	    	@id2 = params[:id2].to_i
	    else
	    	@id2 = params[:id1].to_i
	    	@id1 = params[:id2].to_i
	    end

	   #  if @user.id==@id1
	  	# 	@other = User.find(@id2)
	  	# 	@requested = Friendship.where(id: @user.id, receiver_id: @other.id, accepted: true)
	   #  	@accepted = Friendship.where(id: @other.id, receiver_id: @user.id, accepted: true)
	   #  	if @accepted.empty? and @requested.empty? #make sure they are friends
	   #  		redirect_to root_path
	   #  	end 
	   #  elsif @user.id==@id2
	  	# 	@other = User.find(@id1)
	  	# 	@requested = Friendship.where(id: @user.id, receiver_id: @other.id, accepted: true)
	   #  	@accepted = Friendship.where(id: @other.id, receiver_id: @user.id, accepted: true)
	   #  	if @accepted.empty? and @requested.empty? #make sure they are friends
	   #  		redirect_to root_path
	   #  	end
	  	# else 
	  	# 	redirect_to root_path
	  	# end
	   #  if !@other.nil? #make sure the other user exists
	   #    @messages = Message.where(id: @other.id, receiver_id: @user.id)
	   #    @messages = @messages + Message.where(id: @user.id, receiver_id: @other.id)
	   #    @messages = @messages.sort_by { |obj| obj.sent_at } #loads all the past messages, ordered by date
	   #  end

	   #  @channel = "/"+@id1.to_s+"chatwith"+ @id2.to_s    #create the channel variable

	   #  respond_to do |format|
    #       	format.js
    # 	end
  	end

end