module Member::TaxYearliesHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/tax_yearlies"].merge(path: member_company_tax_yearlies_path(@company))
    if controller_name == 'tax_yearlies'
      result << controller_items[:"member/tax_yearlies"].merge(path: edit_member_company_tax_yearly_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/tax_yearlies"].merge(path: new_member_company_tax_yearly_path(@company), title: 'New yearly tax') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/tax_yearlies'].merge(path: new_member_company_tax_yearly_path(@company), title: 'Add yearly tax') if position == :top and action_name == 'index'
  end
end
