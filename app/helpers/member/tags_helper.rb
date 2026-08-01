module Member::TagsHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/tags"].merge(path: member_company_tags_path(@company))
    if controller_name == 'tags'
      result << controller_items[:"member/tags"].merge(path: edit_member_company_tag_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/tags"].merge(path: new_member_company_tag_path(@company), title: 'New tag') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/tags'].merge(path: new_member_company_tag_path(@company), title: 'Add new tag') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
