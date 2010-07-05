class AddLoginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string
  end

  def self.down
    remove_column :users, :login
  end
end
