class Blog < ActiveRecord::Base
  validates_presence_of :name, :body
end
