class AddUrlToClinics < ActiveRecord::Migration[7.2]
  def change
    add_column :clinics, :url, :string
  end
end
