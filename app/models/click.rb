class Click
  cattr_reader :per_page
  @@per_page = 12

  def self.latest number
    images = Image.order("created_at desc").limit(number)
    ext_images = ExtImage.order("created_at desc").limit(number)
    clicks = Click.sort(images + ext_images)
    clicks.sort_by { |i| i[1] }.reverse[0..5]
  end

  private

  def self.sort unsorted_clicks
    clicks = []
    unsorted_clicks.each_with_index do |click, index|
      clicks[index] = [ click, click.created_at ]
    end
    clicks
  end
end
