class CreateLessonModules < ActiveRecord::Migration
  def self.up
    create_table :lesson_modules do |t|
      t.string :name
      t.text :description
      t.text :global_js
      t.text :global_css
      t.text :template
      t.boolean :developement, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_modules
  end
end

