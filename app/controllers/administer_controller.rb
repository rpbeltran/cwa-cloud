class AdministerController < ApplicationController
    
    def countAdmins
        User.where(:admin => true).count
    end
    
    def isAdmin
        if cookies.key?(:user_id)
            user = User.find_by user_id: cookies.signed[:user_id]
            return user.admin
        end
        return false
    end    
    
    def username
        if cookies.key?(:user_id)
            user = User.find_by user_id: cookies.signed[:user_id]
            return user.name
        end
        return false
    end

    def main
        @users = User.all
        @admin = isAdmin
        @username = username
        @admin_count = countAdmins
        puts @admin_count.class
        @vis = isAdmin || @admin_count == 0
    end    
    
    def new
        if isAdmin || countAdmins == 0
            User.where(:user_id => params[:sel_id]).update_all(:admin => true)
            redirect_to "/admin"
        end
    end
    
end
