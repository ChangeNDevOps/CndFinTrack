class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true

  def teams
    user.teams
  end

  def companies
    user.companies
  end
end
