class StoryController < ApplicationController
    
    def index
        if params[:search_type] == ("tags")
            @stories = query_by_tag(params[:search_term])
        elsif params[:search_type] == ("author")
            @stories = query_by_author(params[:search_term])
        elsif params[:search_type] == ("title")
            @stories = query_by_title(params[:search_term])        
        elsif params[:search_type] == ("genre")
            @stories = query_by_genre(params[:search_term])
        else 
            @stories = Story.all
        end
    end
    
    def show
        @story = Story.find(params[:id])
    end

    def new
        
    end

    def create
        
        if isApproved
            
            if (params[:file] == String) then
                @story = Story.create(story_params_no_file)
                puts 'Successfully Made New Story'
            else
                @story = Story.create(story_params_file)
                @story.file.attach(params[:file])
            end
            
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
        
        def query_by_tag(name)
            Story.where("'" +name+"' = ANY (tags)")
        end
        
        def query_by_title(name)
            Story.where("title LIKE '%" + name + "%'")
        end            
        
        def query_by_genre(name)
            Story.where("genre LIKE '%" + name + "%'")
        end    
        
        def query_by_author(name)
            names = name.split(" ")
            if names.length == 1
                Story.where("firstname LIKE '%"+name+"%'" ).or( Story.where("lastname LIKE '%"+name+"%'" ) )
            else
                Story.where("firstname LIKE '%"+names[0]+"%'" ).where("lastname LIKE '%"+names[1]+"%'" )
            end
        end
    
end