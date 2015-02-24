class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @user = current_user
      @scenes = Scene.where(creator_id: @user.id)
      @user.current_scene = nil
      @user.save
      if !@user.tutorial_done
        if PreQuestionnaire.find_by(user_id: @user.id).nil?
          redirect_to "/preUseQuestionnaire"
        else
          redirect_to "/tutorial"
        end
      end
    end
  end

  def terms
    if user_signed_in?
      @user = current_user
    end
  end

  def preUseQuestionnaire
    if user_signed_in?
      @user = current_user
      @questionnaire = PreQuestionnaire.new
    end
  end
  def postUseQuestionnaire
    if user_signed_in?
      @user = current_user
      @questionnaire = PostQuestionnaire.new
    end
  end
end