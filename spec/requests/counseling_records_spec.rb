require "rails_helper"

RSpec.describe "CounselingRecords", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before { sign_in user }

  describe "GET /index" do
    it "returns http success" do
      get counseling_records_path
      expect(response).to have_http_status(:success)
    end

    it "検討状況でフィルタできる" do
      create(:counseling_record, user: user, status: :considering)
      create(:counseling_record, user: user, status: :decided)
      get counseling_records_path, params: { status: "decided" }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_counseling_record_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:treatment) { create(:treatment) }

    it "有効な値の場合、記録が作成される" do
      expect {
        post counseling_records_path, params: {
          clinic_name: "新宿クリニック",
          counseling_record: {
            treatment_area: "eye",
            counseling_date: Date.today,
            treatment_id: treatment.id
          }
        }
      }.to change(CounselingRecord, :count).by(1)
      expect(response).to redirect_to(counseling_records_path)
    end

    it "クリニック名が空欄の場合、作成されない" do
      expect {
        post counseling_records_path, params: {
          clinic_name: "",
          counseling_record: {
            treatment_area: "eye",
            counseling_date: Date.today,
            treatment_id: treatment.id
          }
        }
      }.not_to change(CounselingRecord, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /show" do
    it "自分の記録は閲覧できる" do
      record = create(:counseling_record, user: user)
      get counseling_record_path(record)
      expect(response).to have_http_status(:success)
    end

    it "他ユーザーの記録は閲覧できない" do
      record = create(:counseling_record, user: other_user)
      get counseling_record_path(record)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /edit" do
    it "自分の記録は編集画面を開ける" do
      record = create(:counseling_record, user: user)
      get edit_counseling_record_path(record)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "有効な値の場合、更新される" do
      record = create(:counseling_record, user: user)
      patch counseling_record_path(record), params: {
        clinic_name: record.clinic.name,
        counseling_record: { doctor: "更新後の医師名" }
      }
      expect(response).to redirect_to(counseling_record_path(record))
      expect(record.reload.doctor).to eq("更新後の医師名")
    end
  end

  describe "DELETE /destroy" do
    it "自分の記録を削除できる" do
      record = create(:counseling_record, user: user)
      expect {
        delete counseling_record_path(record)
      }.to change(CounselingRecord, :count).by(-1)
      expect(response).to redirect_to(counseling_records_path)
    end

    it "他ユーザーの記録は削除できない" do
      record = create(:counseling_record, user: other_user)
      expect {
        delete counseling_record_path(record)
      }.not_to change(CounselingRecord, :count)
      expect(response).to have_http_status(:not_found)
    end
  end
end
