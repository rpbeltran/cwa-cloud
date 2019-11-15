class StoryController < ApplicationController
    
    def index
        #params[:tag] ? @stories = Story.tagged_with(params[:tag]) : @stories = Story.all
    end
    
    def show
        @story = Story.find(params[:id])
    end

    def new
        
    end

    def create
        if (params[:file] == String) then
            @story = Story.create(story_params_no_file)
            puts 'Successfully Made New Story'
        else
            @story = Story.create(story_params_file).file.attach(nil)
        end
        redirect_to story_new_path
    end
    
    private
    
        def story_params_no_file
            params.require(:title)
            params.require(:firstname)
            params.require(:lastname)
            params.require(:file)
            params.permit(:title, :firstname, :lastname, :file, :genre, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
        end
        
        def story_params_file
            params.require(:title)
            params.require(:firstname)
            params.require(:lastname)
            params.permit(:title, :firstname, :lastname, :genre, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
        end
    
end
