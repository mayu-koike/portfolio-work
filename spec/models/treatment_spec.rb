require 'rails_helper'

RSpec.describe Treatment, type: :model do
  describe "associations" do
    it "has many counseling_records" do
      expect(described_class.reflect_on_association(:counseling_records).macro).to eq(:has_many)
    end
  end

  describe "validations" do
    subject { build(:treatment) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end
end
