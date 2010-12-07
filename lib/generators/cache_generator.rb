require 'rails/generators/active_record'

module Rails
  module Generators
    class CacheGenerator < ActiveRecord::Generators::Base
      argument :name, :type => :string, :default => ""
      source_root File.expand_path("../templates", __FILE__)
      
      def create_migration_file
        migration_template "migration.rb", "db/migrate/create_cache.rb"
      end
    end
  end
end