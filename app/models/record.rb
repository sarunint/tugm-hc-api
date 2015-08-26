class Record < ActiveRecord::Base
  belongs_to :team
  belongs_to :question
  validates :correct, inclusion: { in: [true, false] }
end
