class LayoutsController < ApplicationController

	def show
		if user_signed_in?
			@user = current_user
		    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: @user.id)
		end
		respond_to do |format|
	      format.js { render :online }
	    end
  	end
end