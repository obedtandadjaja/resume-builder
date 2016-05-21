class Experience < ActiveRecord::Base
  has_many :experience_duty
  belongs_to :resume
end
