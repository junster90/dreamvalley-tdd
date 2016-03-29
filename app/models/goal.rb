class Goal < ActiveRecord::Base
  belongs_to :user

  validates :type, :description, :user, presence: true

  extend Enumerize
  enumerize :type, in: [:experience, :growth, :contribution], predicates:true, scope: true
end
