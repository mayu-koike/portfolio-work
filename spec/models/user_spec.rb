require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "has many clinics" do
      expect(described_class.reflect_on_association(:clinics).macro).to eq(:has_many)
    end

    it "has many counseling_records" do
      expect(described_class.reflect_on_association(:counseling_records).macro).to eq(:has_many)
    end

    it "returns the clinics belonging to the user" do
      user = create(:user)
      clinic = create(:clinic, user: user)

      expect(user.clinics).to include(clinic)
    end
  end

  describe "validations" do
    subject { build(:user) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "email" do
      it "is invalid without an email" do
        subject.email = nil
        expect(subject).not_to be_valid
      end

      it "is invalid with a duplicate email" do
        create(:user, email: "duplicate@example.com")
        subject.email = "duplicate@example.com"
        expect(subject).not_to be_valid
      end
    end

    describe "password" do
      it "is invalid without a password" do
        subject.password = nil
        expect(subject).not_to be_valid
      end

      it "is invalid with a password shorter than 6 characters" do
        subject.password = "12345"
        subject.password_confirmation = "12345"
        expect(subject).not_to be_valid
      end

      it "is valid with a password of 6 characters or more" do
        subject.password = "123456"
        subject.password_confirmation = "123456"
        expect(subject).to be_valid
      end
    end
  end
end
