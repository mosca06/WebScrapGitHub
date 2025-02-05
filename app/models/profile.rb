class Profile < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user_id }
  validates :name, presence: true
  before_validation -> { Webscrap::GitHub.call(self) }
end
