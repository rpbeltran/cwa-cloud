class StoryController < ApplicationController
    def new
        @story = Story.new
    end
end
