module Member::ExpensesHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/expenses"].merge(path: member_company_expenses_path(@company))
    if controller_name == 'expenses'
      result << controller_items[:"member/expenses"].merge(path: edit_member_company_expense_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/expenses"].merge(path: new_member_company_expense_path(@company), title: 'New expense') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/expenses'].merge(path: new_member_company_expense_path(@company), title: 'Add new expense') if position == :top and action_name == 'index'
  end
end
