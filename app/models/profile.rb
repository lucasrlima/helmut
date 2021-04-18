class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true
  has_many :skills
  validates :role, presence: true, inclusion: {in: ['Jornalista', 'Fotógrafo' ] }

  include PgSearch::Model
  pg_search_scope :search_profile_index,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } 
    }

end
