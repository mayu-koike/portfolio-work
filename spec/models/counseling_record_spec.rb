require 'rails_helper'

RSpec.describe CounselingRecord, type: :model do
  describe "associations" do
    it "belongs to a user" do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it "belongs to a clinic" do
      expect(described_class.reflect_on_association(:clinic).macro).to eq(:belongs_to)
    end

    it "belongs to a treatment" do
      expect(described_class.reflect_on_association(:treatment).macro).to eq(:belongs_to)
    end
  end

  describe "enums" do
    it "defines treatment_area as an enum" do
      expect(described_class.treatment_areas).to eq(
        "eye" => 0, "nose" => 1, "contour" => 2, "lip" => 3, "skin" => 4, "other" => 5
      )
    end

    it "defines status as an enum" do
      expect(described_class.statuses).to eq(
        "considering" => 0, "booked" => 1, "decided" => 2, "dropped" => 3
      )
    end

    it "allows setting treatment_area and status by name" do
      record = build(:counseling_record, treatment_area: :nose, status: :booked)

      expect(record.treatment_area).to eq("nose")
      expect(record.status).to eq("booked")
    end
  end

  describe "validations" do
    subject { build(:counseling_record) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a treatment_area" do
      subject.treatment_area = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a counseling_date" do
      subject.counseling_date = nil
      expect(subject).not_to be_valid
    end

    describe "risk_disclosure_honesty" do
      it "is valid when nil" do
        subject.risk_disclosure_honesty = nil
        expect(subject).to be_valid
      end

      it "is valid within 1..5" do
        subject.risk_disclosure_honesty = 1
        expect(subject).to be_valid

        subject.risk_disclosure_honesty = 5
        expect(subject).to be_valid
      end

      it "is invalid outside 1..5" do
        subject.risk_disclosure_honesty = 0
        expect(subject).not_to be_valid

        subject.risk_disclosure_honesty = 6
        expect(subject).not_to be_valid
      end
    end

    describe "proposal_satisfaction" do
      it "is valid when nil" do
        subject.proposal_satisfaction = nil
        expect(subject).to be_valid
      end

      it "is valid within 1..5" do
        subject.proposal_satisfaction = 1
        expect(subject).to be_valid

        subject.proposal_satisfaction = 5
        expect(subject).to be_valid
      end

      it "is invalid outside 1..5" do
        subject.proposal_satisfaction = 0
        expect(subject).not_to be_valid

        subject.proposal_satisfaction = 6
        expect(subject).not_to be_valid
      end
    end

    describe "estimated_cost" do
      it "is valid when nil" do
        subject.estimated_cost = nil
        expect(subject).to be_valid
      end

      it "is valid when zero or positive" do
        subject.estimated_cost = 0
        expect(subject).to be_valid
      end

      it "is invalid when negative" do
        subject.estimated_cost = -1
        expect(subject).not_to be_valid
      end
    end

    describe "downtime" do
      it "is valid when nil" do
        subject.downtime = nil
        expect(subject).to be_valid
      end

      it "is valid when zero or positive" do
        subject.downtime = 0
        expect(subject).to be_valid
      end

      it "is invalid when negative" do
        subject.downtime = -1
        expect(subject).not_to be_valid
      end
    end
  end
end
