class Job < ApplicationRecord
  belongs_to :user
  validates :title, :description, :date, :time, :address,
    :issue, :owner, :contact, presence: true
  has_one :skill

  include PgSearch::Model
  pg_search_scope :job_global_search,
    against: [ :description, :title, :issue, :owner, :address ],
    using: {
      tsearch: { prefix: true } 
    }

end
