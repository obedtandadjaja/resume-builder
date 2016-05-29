class Education < ActiveRecord::Base
  has_many :education_accomplishment
  belongs_to :resume

  validates :school_name, presence: true
  validates :school_location, presence: true
  validates :start_date, presence: true, inclusion: (Date.current.year-50)..(Date.current.year)
  validates :end_date, presence: true, inclusion: (Date.current.year-50)..(Date.current.year+10)
  validates :start_date_lower
  validates :degree, presence: true

  private
  def start_date_lower
    errors.add(:start_date, "Should be earlier than end date") if start_date > end_date
  end
end
