require "active_support/cache"

class Cache < ActiveRecord::Base
  set_table_name :cache
end


module ActiveSupport
  module Cache
    class ActiveRecordStore < Store
    
      def initialize
        super

        @data = {}
      end
      
      
      private
      
      def read_entry(key, options = nil)
        if entry = ::Cache.find_by_key(key)
          entry.value
        else
          nil
        end
      end
  
      def write_entry(key, value, options = nil)
        entry = ::Cache.create(:key => key)
        entry.save
      end
  
      def delete_entry(key, options = nil)
        log("Delete", key, options)
        false
      end
    
    end
  end
end