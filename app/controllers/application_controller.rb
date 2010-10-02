class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "default"
  before_filter do |controller|
    controller.init_stylesheets
    controller.init_title
    controller.init_javascripts
  end


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :include_stylesheet, :include_javascript, :add_to_title

  def include_stylesheet(filename)
    @@css << filename
  end

  def include_javascript(filename)
    @@js << filename
  end

  def add_to_title(fragment)
    @@title << fragment
  end

  def init_title
    @@title = []
  end
  def init_javascripts
    @@js  = []
  end
  def init_stylesheets
    @@css = []
  end

  def self.javascripts
    @@js
  end
  def self.stylesheets
    @@css
  end
  def self.title
    @@title
  end
end

