require "rails_helper"

RSpec.describe "CounselingRecords", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /index" do
    it "returns http success" do
      get counseling_records_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      clinic = Clinic.create!(name: "テストクリニック", user: user)
      treatment = Treatment.first || Treatment.create!(name: "テスト施術")
      record = CounselingRecord.create!(
        user: user, clinic: clinic, treatment: treatment,
        treatment_area: :eye, counseling_date: Date.today
      )
      get counseling_record_path(record)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_counseling_record_path
      expect(response).to have_http_status(:success)
    end
  end
end
