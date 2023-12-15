class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @doctors = Doctor.all
  end

  def show;  end

  def new
    @doctor = Doctor.new
    @doctor.build_user
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save!
      redirect_to doctor_path(@doctor), notice: "Le compte docteur a bien été créé"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @doctor.user || @doctor.build_user
  end

  def update
    if @doctor.update!
      redirect_to doctor_path(@doctor), notice: "Le compte docteur a bien été mis à jour"
    else
      render :edit, status: :unprocessable_entity
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
