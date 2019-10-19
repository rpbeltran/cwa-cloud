class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :genre
      t.string :file
      
      
      t.timestamps
    end
  end
end
