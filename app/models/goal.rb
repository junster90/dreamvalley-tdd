class Goal < ActiveRecord::Base
  belongs_to :user

  validates :type, :description, :user, presence: true
end
