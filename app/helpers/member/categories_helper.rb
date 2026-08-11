module Member::CategoriesHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/categories"].merge(path: member_company_categories_path(@company))
    if controller_name == 'categories'
      result << controller_items[:"member/categories"].merge(path: edit_member_company_category_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/categories"].merge(path: new_member_company_category_path(@company), title: 'new') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/categories'].merge(path: new_member_company_category_path(@company), title: 'Add new tag') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
