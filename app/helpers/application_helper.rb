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
end

