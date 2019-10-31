class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :genre
      t.string :file
      t.text :tags, array: true, default: []
      
      t.timestamps
    end
  end
end
