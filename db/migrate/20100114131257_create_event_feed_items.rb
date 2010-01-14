class CreateEventFeedItems < ActiveRecord::Migration
  def self.up
    create_table :event_feed_items do |t|
      t.integer :eventable_id, :actioner_id
      t.string :eventable_type, :actioner_type
      t.string :event, :details
      t.timestamps
    end
    add_index :event_feed_items, :created_at
  end

  def self.down
    drop_table :event_feed_items
  end
end
