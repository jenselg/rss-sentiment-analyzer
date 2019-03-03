require 'rss'
require 'open-uri'

namespace :feed_updater do

  desc "UPDATE FEED ITEMS"
  task item_update: :environment do
    @feeds = Feed.all
    @feeds.each do |feed| # Iterate through available feeds
      @current_feed = feed # Assign current feed to variable
      open(@current_feed.link) do |rss| # Open feed RSS
        @parsed_feed_items = RSS::Parser.parse(rss).items
        @parsed_feed_items.each do |parsed_feed_item| # Iterate through all feed items
          @parsed_feed_item = parsed_feed_item
          @item = @current_feed.items.find_by(title: @parsed_feed_item.title)
          if @item.nil?
            @item = @current_feed.items.new
            @item.title = @parsed_feed_item.title
            @item.link = @parsed_feed_item.link
            @item.description = @parsed_feed_item.description
            @item.published_at = @parsed_feed_item.pubDate.nil? ? Time.now : @parsed_feed_item.pubDate
            begin
              @item_analysis = Sentimentalizer.analyze(@item.title)
              @item.score = @item_analysis.overall_probability
              @item_analysis.token_probabilities.each { |x|
                @lexicon = Lexicon.new
                @lexicon.word = x.token
                @lexicon.probability = x.probability
                @lexicon.save
              }
            rescue
              @item.score = nil
            end
            @item.save
          end
        end
      end
    end
  end

  desc "UPDATE FEED ITEM SCORES"
  task score_update: :environment do
    @items = Item.all
    @items.each do |item|
      @item = item
        begin
          @item_analysis = Sentimentalizer.analyze(@item.title)
          @item.score = @item_analysis.overall_probability
          @item_analysis.token_probabilities.each { |x|
            @lexicon = Lexicon.new
            @lexicon.word = x.token
            @lexicon.probability = x.probability
            @lexicon.save
          }
        rescue
          @item.score = nil
        end
        @item.save
    end
  end

end
