class LessonModulesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    if user_signed_in?
      @modules = LessonModule.in_order.all
    else
      @modules = LessonModule.in_order.active.all
    end
  end

  def new
    @module = LessonModule.new
  end

  def create
    @module = LessonModule.new(params[:lesson_module])
    if @module.save
      flash[:notice] = "Module created successfully."
      redirect_to lesson_modules_path
    else
      render "new"
    end
  end

  def edit
    @module = LessonModule.find(params[:id])
  end

  def update
    @module = LessonModule.find(params[:id])
    @module.update_attributes(params[:lesson_module])

    if @module.save
      flash[:notice] = "Module updated successfully."
      redirect_to lesson_modules_path
    else
      render "edit"
    end
  end

  def update_order
    if(params[:order])
      order = params[:order]

      begin
        order.each_with_index do |value, index|
          item = LessonModule.find(value)
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

  def destroy
    @module = LessonModule.find(params[:id])
    @module.destroy
    redirect_to lesson_modules_path
  end

end

