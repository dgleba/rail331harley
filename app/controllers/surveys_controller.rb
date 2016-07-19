class SurveysController < ApplicationController
  def new
    build_survey_form
  end

  def create
    build_survey_form
    if @form.save
      redirect_to edit_survey_path(@form)
    else
      render 'new'
    end
  end

  def edit
    load_survey_form
  end

  def update
    load_survey_form
    if params[:add_question]
      @form.questions << Question.new
      render 'edit'
    else
      if @form.validate survey_params
        @form.save
        redirect_to edit_survey_path, notice: "Saved."
      else
        render 'edit'
      end
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, questions_attributes: [:title, :type]) if params[:survey]
  end

  def build_survey_form
    survey = Survey.new survey_params
    @form = SurveyForm.new survey
  end

  def load_survey_form
    survey = Survey.find params[:id]
    @form = SurveyForm.new survey
  end
end