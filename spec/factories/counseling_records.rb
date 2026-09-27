FactoryBot.define do
  factory :counseling_record do
    association :user
    association :clinic
    association :treatment
    treatment_area { :eye }
    counseling_date { Date.today }
    status { :considering }
    concerns { "奥二重をぱっちりさせたい" }
    proposal_reason { "ダウンタイムが短いため" }
    estimated_cost { 350_000 }
    downtime { 3 }
    effect_duration { "半永久" }
    revision_guarantee { true }
    risk_disclosure_honesty { 4 }
    proposal_satisfaction { 4 }
    notes { "テストメモ" }
  end
end
