class RemoveDateFromShouty < ActiveRecord::Migration
  def self.up
    remove_column :shouties, :date
  end

  def self.down
  end
end
