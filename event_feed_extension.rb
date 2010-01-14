# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

require 'will_paginate'

class EventFeedExtension < Radiant::Extension
  version "1.0"
  description "Event Feed - shows a page of events, listing activity on your site"
  url "http://www.3hv.co.uk/projects/event_feed"
  
  define_routes do |map|
    map.admin '/admin', :controller => 'Admin::EventFeeds'
    map.namespace :admin do | admin |
      admin.resources :event_feeds, :only => :index
    end
  end
  
  def activate
    admin.tabs.add "Events", "/admin/event_feeds", :before => "Pages", :visibility => [:all]
    
    ActiveRecord::Base.send :include, Eventable
    Page.send :include, ToSExtension
    User.send :include, ToSExtension
    Layout.send :include, ToSExtension
    Snippet.send :include, ToSExtension
    
    Page.records_events
    Layout.records_events
    Snippet.records_events
    User.records_events
  end
  
  def deactivate
    # admin.tabs.remove "Event Feed"
  end
  
end
