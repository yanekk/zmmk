# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_stylesheets
    ApplicationController.stylesheets.map {|css| stylesheet_link_tag(css)}.join("\n")
  end

  def render_javascripts
    ApplicationController.javascripts.map {|js| javascript_include_tag(js)}.join("\n")
  end

  def render_title(separator = " - ")
    ApplicationController.title.join(separator)
  end

end

