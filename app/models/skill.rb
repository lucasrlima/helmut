class Skill < ApplicationRecord
  belongs_to :job
  belongs_to :profile
  has_one :payment

  include PgSearch::Model
  pg_search_scope :skill_global_search,
  against: [ :job_id, :profile_id ],
  associated_against: {
      profile: [ :first_name, :last_name ],
      job: [ :description, :title, :issue, :owner, :address ]
    },
  using: {
    tsearch: { prefix: true }
  } 

end
