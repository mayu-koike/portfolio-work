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
  # 目元
  "二重埋没法",
  "二重切開法",
  "目頭切開法",
  "目尻切開法",
  "眼瞼下垂手術",
  # 鼻
  "鼻尖形成",
  "小鼻縮小",
  "隆鼻術（プロテーゼ）",
  "鼻中隔延長",
  # 輪郭
  "顔の脂肪吸引",
  "脂肪溶解注射",
  "エラボトックス",
  "糸リフト",
  "HIFU",
  # 口元
  "口角挙上",
  "人中短縮",
  "ガミースマイルボトックス",
  # 肌
  "ダーマペン",
  "ポテンツァ",
  "ピコトーニング",
  "フォトフェイシャル",
  "ハイドラフェイシャル",
  # 複数の部位で使う
  "ヒアルロン酸注入",
  # 脱毛
  "顔脱毛",
  "VIO脱毛",
  "全身脱毛",
  # リストにないとき
  "その他"
]

treatments.each do |treatment_name|
  Treatment.find_or_create_by!(name: treatment_name)
end
