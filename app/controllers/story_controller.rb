class StoryController < ApplicationController
    
    def index
        params[:tag] ? @stories = Story.tagged_with(params[:tag]) : @stories = Story.all
    end
    
    def show
        @story = Story.find(params[:id])
    end

    def new
        @story = Story.new
    end

    def create
        @story = Story.new(story_params)
        puts 'Successfully Made New Story'
        redirect_to story_new_path
    end
    
    private
    
        def story_params
            params.require(:title)
            params.require(:firstname)
            params.require(:lastname)
            params.require(:file)
            params.permit(:title, :firstname, :lastname, :file, :genre, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
        end
    
end
