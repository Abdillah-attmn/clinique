class PatientsController < ApplicationController
  before_action :set_patient, only %i[show edit update destroy]

  # GET /patients/:id
  def show; end

  def new
    @patient = Patient.new
  end

  # POST /patients
  def create
    @user = current_user
    @user.profile = Patient.new(patient_params)
    @patient = @user.profile
    if @patient.save!
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /patients/:id/edit
  def edit; end

  # PATCH /patients/:id
  def update
    if @patient.update!(patient_params)
      redirect_to_patient_path(@patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /patients/:id
  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:gender, :birth_date, :address, :zipcode, :city)
  end
end
