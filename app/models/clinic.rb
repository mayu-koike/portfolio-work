class Clinic < ApplicationRecord
  belongs_to :user
  has_many :counseling_records

  validates :name, presence: true

  def self.find_or_create_by_name(user, name)
    return nil if name.blank?
    user.clinics.find_or_create_by(name: name)
  end
end
