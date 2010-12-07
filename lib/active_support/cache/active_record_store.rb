require "active_record/cache_entry"

module ActiveSupport
  module Cache
    class ActiveRecordStore < Store
      
      def cleanup(options = nil)
        CacheEntry.expired.delete_all
      end
      
      def clear(options = nil)
        CacheEntry.delete_all
      end
      
      private
      
      def read_entry(key, options)
        if entry = CacheEntry.find_by_key(key)
          entry.to_cache_entry
        end
      end
      
      def write_entry(key, entry, options)
        if cache = CacheEntry.find_by_key(key)
          delete_entry(key, {})
        end
        CacheEntry.create!({
          :key        => key,
          :value      => entry.value,
          :created_at => entry.created_at,
          :expires_at => entry.expires_at
        })
      end
      
      def delete_entry(key, options)
        CacheEntry.where(:key => key).delete_all
      end
    end
  end
end
