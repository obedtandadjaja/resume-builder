json.array!(@links) do |link|
  json.extract! link, :id, :description, :url, :resume_id
  json.url link_url(link, format: :json)
end
