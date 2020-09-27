class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.bigint :schedule_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
