class ExperienceDuty < ActiveRecord::Base
  belongs_to :experience

  validates :description, presence: true
end
