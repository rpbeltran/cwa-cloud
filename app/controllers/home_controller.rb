class HomeController < ApplicationController

    def main
        @announcements = Announcement.all
    end
    
    def new
        
        if isAdmin
            Announcement.create({ :body => params[:value] })
            redirect_to "/home/"
        end
    end
end
