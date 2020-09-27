class HospitalHasDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_has_doctors do |t|
      t.bigint :hospital_id
      t.bigint :doctor_id

      t.timestamps
    end
  end
end
