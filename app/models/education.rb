class Education < ActiveRecord::Base
  has_many :education_accomplishments
  belongs_to :resume
end
