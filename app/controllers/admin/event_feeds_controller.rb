class Admin::EventFeedsController < ApplicationController

  def index
    @event_feed_items = EventFeedItem.paginate :per_page => 50, :page => params[:page]
  end

end
