class Clinic < ApplicationRecord
  belongs_to :user
  has_many :counseling_records

  validates :name, presence: true
  validates :url, format: { with: %r{\Ahttps?://[^\s/?#]+\S*\z}i, message: "は http:// または https:// で始まる形式で入力してください" }, allow_blank: true

  def self.find_or_create_by_name(user, name)
    return nil if name.blank?
    user.clinics.find_or_create_by(name: name)
  end
end
