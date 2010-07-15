class AssignmentActivationsController < ApplicationController
  before_filter :load_lesson_module
  before_filter :authenticate_user!

  def update
    update_activation_status {|assignment| assignment.activate }
  end

  def destroy
    update_activation_status {|assignment| assignment.deactivate }
  end

  private
  def update_activation_status
    begin
      assignment = Assignment.find(params[:assignment_id])
      yield assignment
      redirect_to lesson_module_assignments_path(@lesson_module)
    rescue Exception => e
      flash[:error] = e.message
      redirect_to lesson_module_assignments_path(@lesson_module)
    end
  end

  def load_lesson_module
      @lesson_module = LessonModule.find(params[:lesson_module_id])
  rescue Exception => e
      flash[:error] = e.message
      redirect_to lesson_modules_assignments_path
  end
end

