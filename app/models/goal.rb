class Goal < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validates :private, inclusion: { in: [true, false] }
  validates  :completed, inclusion: { in: [true, false] }

  belongs_to :user
end
