class PostQuestionnaireController < ApplicationController

  def create
  	@questionnaire = PostQuestionnaire.new(post_params)
  	@questionnaire.save
    redirect_to :root
  end

  private
    
    def post_params
        params.require(:post_questionnaire).permit(:question_1, :question_2, 
        	:question_3, :question_4, :question_5, :question_6, :question_7, 
        	:question_8, :question_9, :question_10, :question_11, 
        	:question_12, :question_13, :question_14, :question_15, :question_16, 
        	:question_17, :question_18, :question_19, :question_20, :question_21, 
        	:question_22, :question_23, :question_24, :question_25, :user_id)
    end


end