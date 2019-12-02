

class ApplicationController < ActionController::Base
    
    def isLogged
        return cookies.key?(:user_id)
    end    
    
    def isApproved
        if isLogged
            user = User.find_by user_id: cookies.signed[:user_id]
            return user.approved
        end
        return false
    end
        
    def isAdmin
        if isLogged
            user = User.find_by user_id: cookies.signed[:user_id]
            return user.admin
        end
        return false
    end    
    
    def username
        if isLogged
            user = User.find_by user_id: cookies.signed[:user_id]
            return user.name
        end
        return false
    end
    
    before_action :initialize_logged_user
    def initialize_logged_user
        @is_logged    = isLogged
        @is_approved  = isApproved
        @logged_user  = username
        @logged_admin = isAdmin
    end
    
end
