class LessonModule < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :template
  validates_format_of :template,
                      :with    => %r{\{content\}}i,
                      :message => "must contain {content} directive for correct lesson display"
  attr_protected :developement
  acts_as_list
  scope :in_order, order("position ASC")
  scope :active, where(["developement = ?", false])

  def activate
    self.developement = false
    save
  end

  def deactivate
    self.developement = true
    save
  end

  def active?
    self.developement ? false : true
  end
end

