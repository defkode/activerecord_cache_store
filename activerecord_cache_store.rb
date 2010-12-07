require "generators/cache_generator"

module ActiveSupport
  module Cache
    autoload :ActiveRecordStore, 'active_support/cache/active_record_store'
  end
end

