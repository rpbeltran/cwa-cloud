class HomeController < ApplicationController
    def rule_params
        params.require(:value)
    end

    def main
        @announcements = Announcement.all
    end
    
    def new
        
        if isAdmin
            Announcement.create({ :value => params[:value] })
            redirect_to "/home/"
        end
    end
end
