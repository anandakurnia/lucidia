class Schedule < ApplicationRecord
  belongs_to :doctor, :foreign_key => "id"
  belongs_to :hospital, :foreign_key => "id"
  has_many :appointments
  has_and_belongs_to_many :patients, :join_table => :appointments, :foreign_key => "schedule_id"
end
