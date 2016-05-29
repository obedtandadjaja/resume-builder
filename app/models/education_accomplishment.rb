class EducationAccomplishment < ActiveRecord::Base
  belongs_to :education

  validates :description, presence: true
end
