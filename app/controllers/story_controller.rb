class StoryController < ApplicationController
    
    def story_params
        params.permit(:author, :storyName)
    end
    
    def new
        @story = Story.create(story_params)
    end
    
end
