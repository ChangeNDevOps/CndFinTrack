module Member::CompaniesHelper
  def form_definition
    [ :member, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/companies"].merge(path: member_companies_path)
    result << controller_items[:"member/companies"].merge(path: member_company_path(@company), title: @company.name) if @company.present?
    if controller_name == 'companies'
      result << controller_items[:"member/companies"].merge(path: member_company_path(@item), title: 'Edit', page_title: "Company #{@company.name}") if action_name == 'show'
      result << controller_items[:"member/companies"].merge(path: edit_member_company_path(@item), title: 'Edit', page_title: "Edit #{@company.name}") if action_name == 'edit'
      result << controller_items[:"member/companies"].merge(path: new_member_company_path(@item), title: 'New company') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/companies'].merge(path: new_member_company_path(@company), title: 'Add new company') if position == :top and action_name == 'index'
  end
end
