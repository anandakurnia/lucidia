class Doctor < ApplicationRecord
  has_and_belongs_to_many :hospitals, :join_table => :hospital_has_doctors
end