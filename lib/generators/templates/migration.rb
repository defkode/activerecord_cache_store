class CreateCache < ActiveRecord::Migration
  def self.up
    create_table :cache, :id => false do |t|
      t.integer  :id, :limit => 8, :unsigned => true
      t.string   :key
      t.binary   :value
      t.decimal  :created_at, :precision => 15, :scale => 5
      t.decimal  :expires_at, :precision => 15, :scale => 5
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
