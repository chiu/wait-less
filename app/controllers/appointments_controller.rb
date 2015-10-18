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

  def create_user_api
    # t.string   "email",                  default: "", null: false
    # t.string   "encrypted_password",     default: "", null: false
    # t.string   "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.integer  "sign_in_count",          default: 0,  null: false
    # t.datetime "current_sign_in_at"
    # t.datetime "last_sign_in_at"
    # t.string   "current_sign_in_ip"
    # t.string   "last_sign_in_ip"
    # t.datetime "created_at",                          null: false
    # t.datetime "updated_at",                          null: false
    # t.string   "name"
    # t.integer  "role"

    u = User.create({:email => "guy@gmail.com", :password => "11111111", :password_confirmation => "11111111", role: 1 })



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
    params.require(:appointment).permit(:user_id, :finished)
  end

end


