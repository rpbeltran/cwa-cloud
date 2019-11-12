class FixStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :title, :string
    add_column :stories, :firstname, :string
    add_column :stories, :lastname, :string
    add_column :stories, :genre, :string
    add_column :stories, :file, :string
    add_column :stories, :tags, :string, array: true, default: []
  end
end
