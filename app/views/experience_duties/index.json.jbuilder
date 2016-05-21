json.array!(@experience_duties) do |experience_duty|
  json.extract! experience_duty, :id, :description, :experience_id
  json.url experience_duty_url(experience_duty, format: :json)
end
