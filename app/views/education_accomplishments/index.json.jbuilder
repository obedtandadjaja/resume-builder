json.array!(@education_accomplishments) do |education_accomplishment|
  json.extract! education_accomplishment, :id, :description, :education_id
  json.url education_accomplishment_url(education_accomplishment, format: :json)
end
