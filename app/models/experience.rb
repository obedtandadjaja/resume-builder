class Experience < ActiveRecord::Base
  has_many :experience_duty
  belongs_to :resume

  validates :company, presence: true
  validates :location, presence: true
  validates :position, presence: true
  validates :start_date, presence: true, inclusion: (Date.current.year-50)..(Date.current.year)
  validate :end_date_validation

  private
  def start_date_lower
    errors.add(:start_date, "Should be earlier than end date") if start_date > end_date
  end

  def end_date_validation
    if !is_employed
      validates :end_date, presence: true, inclusion: (Date.current.year-50)..(Date.current.year+10)
      validate :start_date_lower
    end
  end
end
