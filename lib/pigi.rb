require "pigi/version"
require "thor"
require 'rubygems'

module Pigi
  class IDFileManager
    @@filePath = Gem.loaded_specs['pigi'].full_gem_path + "/pivotal_tracker_story_id"

    def self.saveIDToFile(id)
      File.write(@@filePath, "#{id}")
    end

    def self.readID
      if File::exists?(@@filePath)
        arr = IO.readlines(@@filePath)
        arr[0]
      else 
        "ID wasn't set. Set your ID once again using s command."
      end
    end
  end

  class SetID < Thor
    desc "s <id>", "Set <id> of your Pivotal Tracker story."
    def s(id)
      if !/\A\d{8}\z/.match(id)
        puts "Invalid story ID format. Set your ID once again using s command."
      else 
        puts "Set project ID: #{id}"
        IDFileManager.saveIDToFile(id)
      end
    end

    desc "m <message>", "Execute a 'git commit -m' command with argument in format '<message> [#<id>]'."
    def m(message)
      pivotalTrackerID = IDFileManager.readID()
      if !/\A\d{8}\z/.match(pivotalTrackerID)
        puts "Invalid story ID format. Set your ID once again using s command."
      else
        command = "git commit -m \"" + message + " [##{pivotalTrackerID}]\""
        system(command)
      end
    end
  end
end
