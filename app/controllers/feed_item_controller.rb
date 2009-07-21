class FeedItemController < ApplicationController

  def show
      @feed_item = FeedItem.find(params[:id])

      if @feed_item.clicks.nil?
        @feed_item.clicks = 0
      end
      
      @feed_item.clicks = @feed_item.clicks + 1
      @feed_item.save
  end
  
  def redir
    @feed_item = FeedItem.find(params[:id])
    
    if @feed_item.clicks.nil?
      @feed_item.clicks = 0
    end
    
    @feed_item.clicks = @feed_item.clicks + 1
    @feed_item.save
    
    redirect_to @feed_item.itemUrl
  end
  
  def media
    @feed_items = FeedItem.find(:all, :conditions => "updated_at > DATE_SUB(curdate(), INTERVAL 20 DAY) and image_url is not null", 
            :order => 'updated_at desc')
  end
  
end
