class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true
  has_many :skills
  validates :role, presence: true, inclusion: {in: ['Jornalista', 'Fotógrafo' ] }
end
