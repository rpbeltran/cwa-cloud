class Story < ApplicationRecord
    validates_presence_of :title, :firstname, :lastname
    #serialize :tags, Array
    
    has_many :taggings
    has_many :tags, through: :taggings
    has_one_attached :file
    
    def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
    
    def tag_list
        tags.map(&:name).join(', ')
    end
    
    def tag_list=(names)
        self.tags = name.split(',').map do |n|
            Tag.where(name: n.strip).first_or_create!
        end
    end
end