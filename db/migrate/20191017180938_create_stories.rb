class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :author
      t.string :storyName
      
      
      t.timestamps
    end
  end
end
