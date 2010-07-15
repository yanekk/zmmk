class Assignment < ActiveRecord::Base
  belongs_to :lesson_module
  validates_presence_of :name

  acts_as_list :scope => :lesson_module

  named_scope :in_order, :order => "position ASC"
  named_scope :active, :conditions => ["developement = ?", false]

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
    a = Assignment.find(:first, :conditions => ["(lesson_module_id = ?) AND (position >= #{position+1}) AND (developement = ?)", lesson_module.id, false])
  end

  def last_assignment?
    a = Assignment.find(:first, :conditions => ["(lesson_module_id = ?) AND (position >= #{position+1}) AND (developement = ?)", lesson_module.id, false])
    return false if a
    true
  end
end

