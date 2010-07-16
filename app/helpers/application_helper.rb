# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def include_stylesheet(filename)
    @@css ||= []
    @@css << filename
  end
  def render_stylesheets
    @@css ||= []
    @@css.map {|css| stylesheet_link_tag(css)}.join("\n")
  end

  def include_javascript(filename)
    @@js ||= []
    @@js << filename
  end

  def render_javascripts
    @@js ||= []
    @@js.map {|js| javascript_include_tag(js)}.join("\n")
  end

  def add_to_title(fragment)
    init_title
    @@title << fragment
  end

  def render_title(separator = " - ")
    init_title
    return @@title.join(separator)
  end

  private
  def init_title
    @@title ||= []
  end


end

