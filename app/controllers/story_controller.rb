class StoryController < ApplicationController
    
    def story_params
        params.require([:title, :firstname, :lastname, :file]).permit(:genre)
    end
    
    def index
        
    end

    def new
        puts 'Entered the New Method'
        
    end

    def create
        puts 'Entered the Create Method'
        
        if params[:commit] == "Add Tag" then
            if session[:session_tags] == nil then
                session[:session_tags] = Array.new(0, "A")
                session[:session_tags].push(params[:tag])
            else
                session[:session_tags].push(params[:tag])
                puts session[:session_tags][0]
                session.clear
            end
        end
        
        
        # logic to help debug form submit error
        # convert these into notices eventually
        
        # todo: optomize logic here
        #if params[:title].to_s.strip.empty? then
        #   puts 'Missing Require Field: Title'
        #   redirect_to story_new_path
        #   return
        #elsif params[:firstname].to_s.strip.empty? then
        #   puts 'Missing Require Field: First Name'
        #   redirect_to story_new_path
        #   return
        #elsif params[:lastname].to_s.strip.empty? then
        #   puts 'Missing Require Field: Last Name'
        #   redirect_to story_new_path
        #   return
        #elsif params[:file].to_s.strip.empty? then
        #   puts 'Missing Require Field: File'
        #   redirect_to story_new_path
        #   return
        #end
        #    
        #@story = Story.create(story_params)
        #puts 'Successfully Made New Story'
        
        # go back to the new view
        redirect_to story_new_path
    end
    
end
