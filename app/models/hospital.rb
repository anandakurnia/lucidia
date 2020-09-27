class Hospital < ApplicationRecord
  has_and_belongs_to_many :doctors, :join_table => :hospital_has_doctors
end
