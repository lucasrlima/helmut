class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name_string, presence: true
end
