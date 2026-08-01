module Member::CustomersHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/customers"].merge(path: member_company_customers_path(@company))
    if controller_name == 'customers'
      result << controller_items[:"member/customers"].merge(path: edit_member_company_customer_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/customers"].merge(path: new_member_company_customer_path(@company), title: 'New customer') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/customers'].merge(path: new_member_company_customer_path(@company), title: 'Add new customer') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
