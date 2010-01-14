# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class EventFeedExtension < Radiant::Extension
  version "1.0"
  description "Event Feed - shows a page of events, listing activity on your site"
  url "http://github.com/threehv/Radiant-Eventable"
  
  define_routes do | map |
    map.admin '/admin', :controller => 'Admin::EventFeeds'
    map.namespace :admin do | admin |
      admin.resources :event_feeds, :only => :index
    end
  end

  extension_config do | config | 
    config.gem 'will_paginate'
  end
  
  def activate
    admin.tabs.add "Events", "/admin/event_feeds", :before => "Pages", :visibility => [:all]
    
    ActiveRecord::Base.send :include, Eventable
    
    [Page, User, Layout, Snippet].each do | klass |
      klass.send :include, ToSExtension
      klass.records_events
    end
  end
  
  def deactivate

  end
  
end
