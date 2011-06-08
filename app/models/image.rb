class Image < ActiveRecord::Base
  validates_presence_of :qoute
  cattr_reader :per_page
  @@per_page = 12

  def uploaded_file=(incoming_file)
    self.name         = incoming_file.original_filename
    self.content_type = incoming_file.content_type
    self.human_name   = self.name.gsub(/\./, "_")
    self.content      = incoming_file.read
  end

  def name=(new_filename)
    write_attribute("name", sanitize_filename(new_filename))
  end

  def get_art_path
    ["art_path", human_name]
  end

  private
  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end

end
