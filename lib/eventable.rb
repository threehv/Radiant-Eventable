module Eventable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def records_events
      str_to_eval = <<-EOV
        include Eventable::InstanceMethods

        has_many :event_feed_items, :as => :eventable

        after_create :write_creation_event
        after_update :write_update_event
        after_destroy :write_destroy_event

      EOV
      class_eval str_to_eval
    end

  end

  module InstanceMethods

    protected

    def write_creation_event
      write_event "#{self.to_s} (#{self.class.name}) created", ""
    end
    
    def write_update_event
      write_event "#{self.to_s} (#{self.class.name}) updated", ""
    end
    
    def write_destroy_event
      write_event "#{self.to_s} (#{self.class.name}) deleted", ""
    end
    
    def write_event(message, details)
      EventFeedItem.create :eventable => self, :actioner => UserActionObserver.current_user, :event => message, :details => details
    end

  end

end
