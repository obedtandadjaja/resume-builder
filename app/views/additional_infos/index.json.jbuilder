json.array!(@additional_infos) do |additional_info|
  json.extract! additional_info, :id, :description, :resume_id
  json.url additional_info_url(additional_info, format: :json)
end
