class Team < ActiveRecord::Base
  has_many :records
  validates :name, presence: true
end
