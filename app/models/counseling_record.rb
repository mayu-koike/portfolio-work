class CounselingRecord < ApplicationRecord
  belongs_to :user
  belongs_to :clinic
  belongs_to :treatment

  enum :treatment_area, { eye: 0, nose: 1, contour: 2, lip: 3, skin: 4, other: 5 }
  enum :status, { considering: 0, booked: 1, decided: 2, dropped: 3 }

  # 効果の持続期間の選択肢（画面に出す文言 => 保存する月数）
  # 「半永久」と説明された場合は 120（10年）として扱う
  EFFECT_DURATION_OPTIONS = {
    "1か月" => 1,
    "3か月" => 3,
    "6か月" => 6,
    "1年" => 12,
    "2年" => 24,
    "3年" => 36,
    "5年" => 60,
    "10年以上（「半永久」と説明された場合）" => 120
  }.freeze

  validates :treatment_area, presence: true
  validates :counseling_date, presence: true
  validates :risk_disclosure_honesty, inclusion: { in: 1..5, message: "は1〜5で選択してください" }, allow_nil: true
  validates :proposal_satisfaction, inclusion: { in: 1..5, message: "は1〜5で選択してください" }, allow_nil: true
  validates :estimated_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :downtime, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :effect_duration_months, inclusion: { in: EFFECT_DURATION_OPTIONS.values, message: "は選択肢から選んでください" }, allow_nil: true
end
