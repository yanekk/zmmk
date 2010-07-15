class AddPositionToLessonModule < ActiveRecord::Migration
  def self.up
    add_column :lesson_modules, :position, :integer
  end

  def self.down
    remove_column :lesson_modules, :position
  end
end

