class AppointmentsController < ApplicationController
  


    def index
        @appointments = Appointment.all
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def new
        @appointment = Appointment.new
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def create

        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = current_user.id

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
        params.require(:appointment).permit(:user_id, :finished,
            )
    end

end


