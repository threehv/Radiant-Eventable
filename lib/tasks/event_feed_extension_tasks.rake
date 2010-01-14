namespace :radiant do
  namespace :extensions do
    namespace :event_feed do
      
      desc "Clean up and delete any events that are older than 28 days old" 
      task :clean_up => :environment do
        EventFeedItem.delete_all ['created_at < ?', 28.days.ago]
      end
      
      desc "Runs the migration of the Event Feed extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          EventFeedExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          EventFeedExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Event Feed to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from EventFeedExtension"
        Dir[EventFeedExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(EventFeedExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
