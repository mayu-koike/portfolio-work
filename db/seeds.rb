# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

treatments = [
  "二重埋没法",
  "二重切開法",
  "目頭切開法",
  "目尻切開法",
  "眼瞼下垂手術",
  "ダーマペン",
  "ポテンツァ",
  "ピコトーニング",
  "フォトフェイシャル",
  "ハイドラフェイシャル",
  "顔脱毛",
  "VIO脱毛",
  "全身脱毛"
]

treatments.each do |treatment_name|
  Treatment.find_or_create_by!(name: treatment_name)
end
