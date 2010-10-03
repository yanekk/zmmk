class Assignment < ActiveRecord::Base
  belongs_to :lesson_module
  validates_presence_of :name

  acts_as_list :scope => :lesson_module

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

  def next_assignment
    a = Assignment.where(["(lesson_module_id = ?) AND (position >= #{position+1}) AND (developement = ?)", lesson_module.id, false]).first
  end

  def last_assignment?
    a = Assignment.where(["(lesson_module_id = ?) AND (position >= #{position+1}) AND (developement = ?)", lesson_module.id, false]).first
    return false if a
    true
  end
end

