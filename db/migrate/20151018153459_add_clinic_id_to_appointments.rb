class AddClinicIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :clinic_id, :integer
  end
end
