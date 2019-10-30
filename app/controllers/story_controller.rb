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
        
        # logic to help debug form submit error
        # convert these into notices eventually
        
        if params[:title] == "" then
           puts 'Missing Require Field: Title'
           redirect_to story_new_path
           return
        elsif params[:firstname] == "" then
           puts 'Missing Require Field: First Name'
           redirect_to story_new_path
           return
        elsif params[:lastname] == "" then
           puts 'Missing Require Field: Last Name'
           redirect_to story_new_path
           return
        elsif params[:file] == "" then
           puts 'Missing Require Field: File'
           redirect_to story_new_path
           return
        end
            
        @story = Story.create(story_params)
        puts 'Successfully Made New Story'
        
        # go back to the new view
        redirect_to story_new_path
    end
    
end
