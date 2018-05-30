module MovieDecorator
  def youtube_tag
    content_tag :iframe, '', width: 560, height: 315, src: url, frameborder: 0, allow: 'autoplay; encrypted-media'
  end
end
