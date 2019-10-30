class StoryController < ApplicationController
    
    def story_params
        params.require([:title, :firstname, :lastname, :file]).permit(:genre)
    end
    
    def index
        @story = story.all
    end

    def new
        puts 'Entered the New Method'
    end

    def create
        puts 'Entered the Create Method'
        
        begin
            @story = Story.create!(story_params)
        rescue => error
            # refine this to all for better feedback on the missing / wrong params
            puts 'Missing One or More Required Params'
            puts error
        end
        # go back to the new view
        redirect_to story_new_path
    end
    
end
