class Member::TeamsController < Member::ApplicationController
  private

  def back_path
    member_teams_path
  end

  def datum_name
    'Team'
  end

  def datum
    Current.teams
  end

  def item_params
    unless params[:team].present?
      return {}
    end
    params.expect(team: [ :name, user_ids: [] ])
  end

  def after_create_call_back
    @item.team_users.create(role: :owner, user: Current.user)
  end
end
