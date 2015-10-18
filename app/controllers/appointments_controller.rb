class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def display_api
    @appointments = Appointment.all
    render json: @appointments
  end

  def handle_cor
    binding.pry

    u = User.find_by_email(appointment_params[:email]) || User.create({:email => appointment_params[:email], :password => appointment_params[:email], :password_confirmation => appointment_params[:email], role: 3 })
    clinic_id = appointment_params[:clinic_id]
    binding.pry
    if Appointment.where(user_id: u.id, clinic_id: clinic_id).empty? 
      a=Appointment.create(clinic_id: clinic_id, user_id: u.id)
    end
    binding.pry


    # u = User.create({:email => "guy@gmail.com", :password => "11111111", :password_confirmation => "11111111", role: 1 })
    # name, email, password, phone_number, clinic_id


    result = "super success"
    render json: result
  end

  def new
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if current_user 
      @appointment.user_id = current_user.id
    end
    if @appointment.save
      redirect_to appointments_path, notice: "#{@appointment.user_id} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  protected

  def appointment_params
    params.require(:appointment).permit(:user_id, :finished, :name, :email, :password, :password_confirmation, :phone_number, :clinic_id)
  end

end


