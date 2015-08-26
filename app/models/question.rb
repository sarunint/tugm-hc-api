class Question < ActiveRecord::Base
  has_many :records
  validates :max_score, presence: true
end
