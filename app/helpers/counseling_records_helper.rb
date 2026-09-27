module CounselingRecordsHelper
  def status_badge_class(status)
    case status
    when "decided" then "bg-rose-800 text-white"
    when "considering" then "bg-amber-50 text-amber-700"
    when "booked" then "bg-sky-50 text-sky-700"
    else "bg-stone-100 text-stone-500"
    end
  end
end
