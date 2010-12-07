class CreateCache < ActiveRecord::Migration
  def self.up
    create_table :cache do |t|
      t.string   :key
      t.string   :value
      t.datetime :created_at
      t.datetime :expires_in
    end
  end

  def self.down
    drop_table :cache
  end
end
