class CreateCache < ActiveRecord::Migration
  def self.up
    create_table :cache do |t|
      t.string   :key
      t.text     :value
      t.float    :created_at
      t.float    :expires_at
    end
    
    add_index :cache, :key, :unique => true
    add_index :cache, :created_at
    add_index :cache, :expires_at
  end

  def self.down
    drop_table :cache
    
    remove_index :cache, :key
    remove_index :cache, :created_at
    remove_index :cache, :expires_at
  end
end
