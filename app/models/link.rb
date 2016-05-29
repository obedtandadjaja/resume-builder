class Link < ActiveRecord::Base
  belongs_to :resume

  validates :description, presence: true
  validates :url, presence: true
end
