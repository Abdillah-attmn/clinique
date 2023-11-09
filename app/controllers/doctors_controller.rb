class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @doctors = Doctor.all
  end

  def show;  end

  def new
    @doctor = Doctor.new
  end

  def create
    @user = current_user
    @user.profile = Doctor.new(doctor_params)
    @doctor = @user.profile
    if @doctor.save!
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:speciality)
  end
end
