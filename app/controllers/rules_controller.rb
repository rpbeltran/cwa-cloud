class RulesController < ApplicationController
    

    def main
        @rules = Rule.all
        @rules_text = @rules.map { |i| i.value }.join("\n")
    end
    
    def new
        
        if isAdmin
            Rule.create({ :value => params[:value] })
            redirect_to "/rules/"
        end
    end
    
    
    def update
        if isAdmin
            Rule.delete_all
            params[:value].split("\n").each{ |val|
                if not val.strip.empty?
                    Rule.create({ :value => val })
                end
            }
            redirect_to "/rules/"
        end
    end
end
