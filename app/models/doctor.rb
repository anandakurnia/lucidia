class Doctor < ApplicationRecord
  has_and_belongs_to_many :hospitals, :join_table => :hospital_has_doctors
  has_many :schedules
  has_many :appointments, :through => :schedules
end
