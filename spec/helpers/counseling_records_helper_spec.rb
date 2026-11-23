require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CounselingRecordsHelper. For example:
#
# describe CounselingRecordsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CounselingRecordsHelper, type: :helper do
  describe "#effect_duration_label" do
    it "未入力の場合、- を返す" do
      expect(helper.effect_duration_label(nil)).to eq("-")
    end

    it "選択肢にある月数の場合、その文言を返す" do
      expect(helper.effect_duration_label(12)).to eq("1年")
    end

    it "120か月の場合、10年以上を返す" do
      expect(helper.effect_duration_label(120)).to eq("10年以上")
    end
  end
end
