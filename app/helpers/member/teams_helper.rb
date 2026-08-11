module Member::TeamsHelper
  def breadcrumbs
    result = super
    result << controller_items[:"member/teams"].merge(path: member_teams_path)
    if controller_name == 'teams'
      result << controller_items[:"member/teams"].merge(path: edit_member_team_path(@item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/teams"].merge(path: new_member_team_path, title: 'New team') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/teams'].merge(path: new_member_team_path, title: 'Add new team') if position == :top and action_name == 'index'
  end
end
