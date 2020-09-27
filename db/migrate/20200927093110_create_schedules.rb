class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.bigint :doctor_id
      t.bigint :hospital_id
      t.datetime :time

      t.timestamps
    end
  end
end
