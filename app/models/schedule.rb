class Schedule < ApplicationRecord
  belongs_to :doctor, :foreign_key => "id"
  belongs_to :hospital, :foreign_key => "id"
end
