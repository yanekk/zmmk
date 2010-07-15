class LessonModuleActivationsController < ApplicationController
  before_filter :authenticate_user!

  def update
    update_activation_status {|lesson_module| lesson_module.activate }
  end

  def destroy
    update_activation_status {|lesson_module| lesson_module.deactivate }
  end

  private
  def update_activation_status
    begin
      lesson_module = LessonModule.find(params[:lesson_module_id])
      yield lesson_module
      redirect_to lesson_modules_path
    rescue Exception => e
      flash[:error] = e.message
      redirect_to lesson_modules_path
    end
  end
end

