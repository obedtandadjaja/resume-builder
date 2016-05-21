json.array!(@experiences) do |experience|
  json.extract! experience, :id, :company, :position, :location, :start_date, :end_date, :is_employed, :resume_id
  json.url experience_url(experience, format: :json)
end
