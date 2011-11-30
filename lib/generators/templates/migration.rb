class CreateCache < ActiveRecord::Migration
  def self.up
    create_table :cache do |t|
      t.string   :key
      t.binary   :value
      t.float    :created_at
      t.float    :expires_at
      t.boolean  :is_compressed
    end
    
    add_index :cache, :key, :unique => true
    add_index :cache, :created_at
    add_index :cache, :expires_at
  end

  def self.down
    drop_table :cache
  end
end
