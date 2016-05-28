class Education < ActiveRecord::Base
  has_many :education_accomplishment
  belongs_to :resume
end
