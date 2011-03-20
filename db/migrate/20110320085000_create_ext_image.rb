class CreateExtImage < ActiveRecord::Migration
  def self.up
    create_table :ext_images do |t|
      t.string :name
      t.string :qoute
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :ext_images
  end
end
