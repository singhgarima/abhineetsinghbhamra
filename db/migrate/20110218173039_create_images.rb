class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :human_name
      t.string :name
      t.string :qoute
      t.binary :content
      t.string :content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
