class LayoutsController < ApplicationController

	def show
		if user_signed_in?
			#This checks for currently online users
			@user = current_user
		    @unavailable = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: @user.id)
		    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours), available: true).where.not(id: @user.id)
		    #check for unread messages
		    @messagesreceived = Message.where(receiver_id: @user.id, seen: false).order(:sent_at)
		    @messagessent = @messagesreceived
		    if !@messagesreceived.empty?
		    	#can only recieve messages from one person at a time
		    	@user.update_attribute(:available, false)
		    	#find the sender of the most recent unread message
		    	@other = User.find(@messagesreceived.first.sender_id)
		    	#find all messages send to current user
		    	@messagesreceived = Message.where(sender_id: @other.id, receiver_id: @user.id).order(:sent_at)
		    	#find all messages sent from user to other messager
		    	@messagessent = Message.where(sender_id: @user.id, receiver_id: @other.id).order(:sent_at)
		    end		    
		    @messages = @messagesreceived + @messagessent
		    #order all messages between these two and store it in messages
		    @messages = @messages.sort_by { |obj| obj.sent_at }
		end
		respond_to do |format|
	      format.js { 
	      	if @messages.nil? || @messages.empty?
	      		render :online 
	      	else
	      		render :chat
	      	end
	      }
	    end
  	end

  	def openchat
  		p "IN OPEN CHAT WITH " + params[:id1] + " AND " + params[:id2]
		if user_signed_in?
			@user = current_user
			@other = User.find(params[:id2])
		    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours), available: true).where.not(id: @user.id)
		end
		respond_to do |format|
	      format.js { render :chat }
	    end
  	end
end