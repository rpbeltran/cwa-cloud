class RulesController < ApplicationController
    
    def rule_params
        params.require(:value)
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
        @rules = Rule.all
        @admin = isAdmin
        @username = username
    end
    
    def new
        
        if isAdmin
            Rule.create({ :value => params[:value] })
            redirect_to "/rules/"
        end
    end
end
