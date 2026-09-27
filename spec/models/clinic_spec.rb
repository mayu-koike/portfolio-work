require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe "associations" do
    it "belongs to a user" do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it "has many counseling_records" do
      expect(described_class.reflect_on_association(:counseling_records).macro).to eq(:has_many)
    end

    it "returns the user it belongs to" do
      user = create(:user)
      clinic = create(:clinic, user: user)

      expect(clinic.user).to eq(user)
    end
  end

  describe "validations" do
    subject { build(:clinic) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
end
