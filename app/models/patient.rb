class Patient < ApplicationRecord
  has_and_belongs_to_many :schedules, :join_table => :appointments
end
