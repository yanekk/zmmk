class AssignmentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :load_lesson_module
  before_filter :load_assignment, :only => [:edit, :update, :destroy, :show, :copy]

  def index
    if user_signed_in?
      @assignments = @lesson_module.assignments.in_order.all
    else
      @assignments = @lesson_module.assignments.in_order.active.all
    end

  end

  def show
    respond_to do |format|
      format.css { render :text => [@lesson_module.global_css, @assignment.css].join("\n") }
      format.js  { render :text => [@lesson_module.global_js, @assignment.js].join("\n")   }
      format.html do
        @content  = @lesson_module.template

        @temp = @assignment.template.to_s

        while match = @temp.match(/\{(.*?)\}(.*)\{\/\1\}/m)
          current_tag = $1
          @content = @content.gsub(/\{#{current_tag}\}/, $2)
          @temp = @temp.gsub(/\{#{current_tag}\}.*\{\/#{current_tag}\}/m, "")
        end

        @content = @content.gsub(/\{content\}/, @temp.strip)
        @content = @content.gsub(/\{.*?\}/, "")
      end
    end
  end

  def new
    @assignment = @lesson_module.assignments.new
  end

  def create
    @assignment = @lesson_module.assignments.new(params[:assignment])
    if @assignment.save
      flash[:notice] = "Assignment saved."
      redirect_to lesson_module_assignments_path(@lesson_module)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    @assignment.update_attributes(params[:assignment])
    if @assignment.save
      flash[:notice] = "Assignment saved."
      redirect_to lesson_module_assignments_path(@lesson_module)
    else
      render "edit"
    end
  end

  def destroy
    @assignment.destroy
    redirect_to lesson_module_assignments_path(@lesson_module)
  end

  def update_order
    if(params[:order])
      order = params[:order]

      begin
        order.each_with_index do |value, index|
          item = Assignment.find(value)
          item.insert_at(index+1)
          item.save!
        end
        render :json => {:result => "OK"}.to_json
      rescue Exception => e
        render :json => {:error => e.message}.to_json
      end

    else
      render :json => {:error => "No order parameter provided."}.to_json
    end
  end

  def copy
    copy = Assignment.new(@assignment.attributes)
    copy.name += "(copy)"
    copy.insert_at(@assignment.position + 1)
    copy.save
    redirect_to lesson_module_assignments_path(params[:lesson_module_id])
  end

  private
  def load_lesson_module
    @lesson_module = LessonModule.find(params[:lesson_module_id])
  rescue Exception => e
    flash[:error] = e.message
    redirect_to lesson_modules_path
  end

  def load_assignment
    @assignment = @lesson_module.assignments.find(params[:id])
  rescue
    flash[:error] = e.message
    redirect_to lesson_module_assignments_path(@lesson_module)
  end
end

