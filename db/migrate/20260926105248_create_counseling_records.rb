class CreateCounselingRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :counseling_records do |t|
      t.integer :treatment_area, null: false
      t.string :doctor
      t.date :counseling_date, null: false
      t.integer :status, default: 0
      t.text :concerns
      t.text :proposal_reason
      t.integer :estimated_cost
      t.integer :downtime
      t.string :effect_duration
      t.boolean :revision_guarantee, default: false
      t.integer :risk_disclosure_honesty
      t.integer :proposal_satisfaction
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.references :treatment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
