class CreateShouties < ActiveRecord::Migration
  def self.up
    create_table :shouties do |t|
      t.references :user
      t.datetime :date
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :shouties
  end
end
