class PublicPagesController < ApplicationController

    def index
        @feed = Feed.new
        @feeds = Feed.all
    end

end
