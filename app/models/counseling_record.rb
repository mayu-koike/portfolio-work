class CounselingRecord < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  belongs_to :treatment

  enum :treatment_area, { eye: 0, nose: 1, contour: 2, lip: 3, skin: 4, other: 5 }
  enum :status, { considering: 0, booked: 1, decided: 2, dropped: 3 }

  validates :treatment_area, presence: true
  validates :counseling_date, presence: true
  validates :risk_disclosure_honesty, inclusion: { in: 1..5 }, allow_nil: true
  validates :proposal_satisfaction, inclusion: { in: 1..5 }, allow_nil: true
  validates :estimated_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :downtime, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
