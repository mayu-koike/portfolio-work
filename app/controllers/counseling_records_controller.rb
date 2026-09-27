class CounselingRecordsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @counseling_record = current_user.counseling_records.build
  end

  def create
    if params[:clinic_name].blank?
      @counseling_record = current_user.counseling_records.build(counseling_record_params)
      flash.now[:alert] = "クリニック名を入力してください。"
      render :new, status: :unprocessable_entity
      return
    end

    clinic = current_user.clinics.find_or_create_by(name: params[:clinic_name])

    @counseling_record = current_user.counseling_records.build(counseling_record_params)
    @counseling_record.clinic = clinic

    if @counseling_record.save
      redirect_to counseling_records_path, notice: "カウンセリング記録の登録に成功しました"
    else
      flash.now[:alert] = "カウンセリング記録の登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def counseling_record_params
    params.require(:counseling_record).permit(:treatment_area, :doctor, :counseling_date, :status,
    :concerns, :proposal_reason, :estimated_cost, :downtime,
    :effect_duration, :revision_guarantee, :risk_disclosure_honesty,
    :proposal_satisfaction, :notes, :treatment_id)
  end
end
