class AdministerController < ApplicationController
    
    def countAdmins
        User.where(:admin => true).count
    end    
    
    def approvalQueue
        User.where(:approved => [nil, false])
    end
    
    def access
        return isAdmin || countAdmins == 0
    end
    
    def main
        @users = User.where(:approved => true)
        @admin_count = countAdmins
        @access = access
        @approval_queue = approvalQueue
    end
    
    def approve
        if access
            User.where(:user_id => params[:sel_id]).update_all(:approved => true)
            redirect_to "/admin"
        end
    end    
    
    def restrict
        if access
            User.where(:user_id => params[:sel_id]).update_all(:approved => false)
            redirect_to "/admin"
        end
    end
    
    def make_admin
        if access
            User.where(:user_id => params[:sel_id]).update_all(:admin => true)
            redirect_to "/admin"
        end
    end
    
    def revoke_admin
        if access
            User.where(:user_id => params[:sel_id]).update_all(:admin => false)
            redirect_to "/admin"
        end
    end   
    
    def delete_user
        if access
            User.where(user_id: params[:sel_id]).destroy_all
        end
        redirect_to "/admin"
    end
    
    def delete_unapproved
        if access
            approvalQueue.where(user_id: params[:sel_id]).destroy_all
        end
        redirect_to "/admin"
    end
    
end
