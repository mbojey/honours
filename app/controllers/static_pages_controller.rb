class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @user = current_user
      @scenes = Scene.where(creator_id: @user.id)
    end
  end

  def terms
    if user_signed_in?
      @user = current_user
    end
  end
end