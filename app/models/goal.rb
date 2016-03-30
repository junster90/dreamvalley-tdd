class Goal < ActiveRecord::Base
  belongs_to :user

  validates :category, :description, :user, presence: true

  extend Enumerize
  enumerize :category, in: [:experience, :growth, :contribution], predicates: true, scope: true
end
