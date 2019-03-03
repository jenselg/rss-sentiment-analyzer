class FeedsController < ApplicationController

    require 'rss'
    require 'open-uri'

    before_action :set_feed, only: [:show, :destroy]

    def index
        @feed = Feed.new
        @feeds = Feed.all
    end

    def create
        begin
            @feed = Feed.new(feed_params)
            @url = @feed.link
            open(@url) do |rss|
                data = RSS::Parser.parse(rss)
                @feed.title = data.channel.title
                @feed.description = data.channel.description
                @feed.copyright = data.channel.copyright
                if @feed.save
                    redirect_to root_path, notice: "Feed added."
                else
                    redirect_to root_path, notice: "Feed already exists."
                end
            end
        rescue
            redirect_to root_path, notice: "Error adding feed. Enter a valid RSS feed."
        end
    end

    def show
        @items = @feed.items.order('published_at DESC')
    end

    def destroy
        @feed.destroy
        redirect_to root_path
    end

    private

    def set_feed
        @feed = Feed.find(params[:id])
    end

    def feed_params
        params.require(:feed).permit(:link)
    end

end
