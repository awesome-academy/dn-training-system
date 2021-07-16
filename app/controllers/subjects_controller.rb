class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def index
    @subjects = Subject.last_subject.page(params[:page]).per(Settings.subject_per_page)
  end

  def create
    @subject = Subject.new subject_params
    return render :new unless @subject.save
    flash[:success] = t "subject.create_success"
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name_subject, :description, :total_date_lean, :start_date_learn)
  end
end
