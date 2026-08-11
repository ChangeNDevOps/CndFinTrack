class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user
  enum :role, { owner: 0, admin: 1, user: 2 }
end
