json.array!(@educations) do |education|
  json.extract! education, :id, :major, :minor, :degree, :gpa, :class_of, :is_enrolled, :resume_id
  json.url education_url(education, format: :json)
end
