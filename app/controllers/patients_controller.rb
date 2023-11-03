class PatientsController < ApplicationController
  before_action :set_patient, only %i[show edit update destroy]

  def show; end


  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:gender, :birth_date, :address, :zipcode, :city)
  end
end
