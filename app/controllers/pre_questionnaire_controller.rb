class PreQuestionnaireController < ApplicationController

  def create
  	@questionnaire = PreQuestionnaire.new(pre_params)
  	@questionnaire.save
    redirect_to :root
  end

  private
    
    def pre_params
        params.require(:pre_questionnaire).permit(:question_1, :question_2, 
        	:question_3, :question_4, :question_5, :question_6, :question_7, 
        	:question_8, :question_9, :question_10, :user_id)
    end


end