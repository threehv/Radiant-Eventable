class EventFeedItem < ActiveRecord::Base
  belongs_to :eventable, :polymorphic => true
  belongs_to :actioner, :polymorphic => true
  
  default_scope :order => 'created_at desc'
end
