class RulesController < ApplicationController
    
    def rule_params
        params.require(:value)
    end

    def main
        @rules = Rule.all
    end
    
    def new
        
        if isAdmin
            Rule.create({ :value => params[:value] })
            redirect_to "/rules/"
        end
    end
end
