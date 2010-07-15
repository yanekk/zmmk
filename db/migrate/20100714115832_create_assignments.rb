class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.belongs_to :lesson_module
      t.string :name
      t.string :description
      t.text :template
      t.text :css
      t.text :js
      t.boolean :developement, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end

