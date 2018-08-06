module MovieDecorator
  def youtube_tag(options = {})
    options[:src] = url
    options[:width] ||= 560
    options[:height] ||= 315
    options[:frameborder] ||= 0
    options[:allow] ||= 'autoplay; encrypted-media'
    content_tag :iframe, '', options
  end
end
