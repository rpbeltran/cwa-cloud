class StoryController < ApplicationController
    
    def story_params
        params.permit(:title, :firstname, :lastname, :genre, :file)
    end
    
    def new
        @story = Story.create(story_params)
    end
    
end
