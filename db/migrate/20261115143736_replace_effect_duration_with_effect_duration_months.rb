class ReplaceEffectDurationWithEffectDurationMonths < ActiveRecord::Migration[7.2]
  def change
    add_column :counseling_records, :effect_duration_months, :integer
    remove_column :counseling_records, :effect_duration, :string
  end
end
