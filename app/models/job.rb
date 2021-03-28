class Job < ApplicationRecord
  belongs_to :user
  validates :title, :description, :date, :time, :address,
    :issue, :owner, :contact, presence: true
  has_one :skill
end
