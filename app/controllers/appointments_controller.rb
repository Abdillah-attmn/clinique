class AppointmentsController < ApplicationController
  before_action set_appointment, only: %i[show edit update destroy]

  def show;  end

  def new
    @patient = current_user.patient.find_by_id(params[:patient_id])
    @doctor = current_user.doctor.find_by_id(params[:doctor_id])
    if @patient
      @appointment = @patient.appointments.build
    elsif @doctor
      @appointment = @doctor.appointments.build
    else
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor = @doctor
    @appointment.patient = @patient
    if @appointment.save!
      redirect_to_appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit;  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :doctor, :patient)
  end
end
