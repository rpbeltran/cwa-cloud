class StoryController < ApplicationController
    
    def story_params
        params.require(:title).require(:firstname).requrie(:lastname).require(:file).permit(:genre)
    end
    
    def index
        @story = story.all
    end

    def new
        # nothing to do yet
    end

    def create
        # attempt to create a story, validate if we can
        if story_params then
            @story = Story.create(story_params)
        end
    end
    
end
