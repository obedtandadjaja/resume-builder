json.array!(@skills) do |skill|
  json.extract! skill, :id, :title, :resume_id
  json.url skill_url(skill, format: :json)
end
