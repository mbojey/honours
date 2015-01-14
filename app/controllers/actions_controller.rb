class ActionsController < ApplicationController
  protect_from_forgery with: :exception

  def index
  	if user_signed_in?
      @user = current_user
      @action = Action.new
      @action.creator_id = @user.id
      @action.scene_id = params[:id]
      @action.start_x = params[:start_x]
      @action.start_y = params[:start_y]
      @action.end_x = params[:x]
      @action.end_y = params[:y]
	    @action.performed_at = DateTime.now
      @action.scene_count = params[:scene_count]
	    @action.save
  	end
  end
end
