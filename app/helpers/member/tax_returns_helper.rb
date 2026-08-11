module Member::TaxReturnsHelper
  def form_definition
    [ :member, @company, @tax_yearly, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/tax_returns"].merge(path: member_company_tax_yearly_tax_returns_path(@company, @tax_yearly))
    if controller_name == 'tax_returns'
      result << controller_items[:"member/tax_returns"].merge(path: edit_member_company_tax_yearly_tax_return_path(@company, @tax_yearly, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/tax_returns"].merge(path: new_member_company_tax_yearly_tax_return_path(@company, @tax_yearly), title: 'Add new tax return') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/tax_returns'].merge(path: new_member_company_tax_yearly_tax_return_path(@company, @tax_yearly), title: 'Add new tax return') if position == :top and action_name == 'index'
  end
end
