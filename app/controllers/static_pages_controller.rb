class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @user = current_user
      @scenes = Scene.where(creator_id: @user.id)
      @user.current_scene = nil
      @user.save
    end
  end

  def terms
    if user_signed_in?
      @user = current_user
    end
  end
end