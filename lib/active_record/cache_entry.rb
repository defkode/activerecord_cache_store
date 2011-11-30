class CacheEntry < ActiveRecord::Base
  set_table_name :cache
  
  validates :key,        :presence => true, :uniqueness => true
  validates :value,      :presence => true
  validates :created_at, :presence => true
  
  scope :expired, lambda { where("expires_at < ?", Time.now.to_f) }
  
  def expires_in
    expires_at ? expires_at - created_at : nil
  end
  
  def to_cache_entry
    ActiveSupport::Cache::Entry.create(value, created_at, :expires_in => expires_in, :compressed => is_compressed)
  end
end