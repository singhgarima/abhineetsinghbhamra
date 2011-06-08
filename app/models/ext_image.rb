class ExtImage < ActiveRecord::Base
  validates_presence_of :qoute, :name

  def get_art_path
    ["ext_art_path", id]
  end
end
