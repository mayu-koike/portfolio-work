class Clinic < ApplicationRecord
  belongs_to :user
  has_many :counseling_records

  validates :name, presence: true
end
