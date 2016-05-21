class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :education
  has_many :experience
  has_many :link
  has_many :additional_info
  has_many :skill
end
