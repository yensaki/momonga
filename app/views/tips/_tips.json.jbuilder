json.array! @tips do |tip|
  json.id tip.id
  json.title tip.title
  json.url tip_url(tip)
  json.youtube_urls tip.movies.map { |movie| movie.url }
end
