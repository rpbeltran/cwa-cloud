class AdministerController < ApplicationController
    
    def countAdmins
        User.where(:admin => true).count
    end
    
    def access
        return isAdmin || countAdmins == 0
    end
    
    def main
        @users = User.all
        @admin_count = countAdmins
        @access = access
    end
    
    def new
        if access
            User.where(:user_id => params[:sel_id]).update_all(:admin => true)
            redirect_to "/admin"
        end
    end
    
end
