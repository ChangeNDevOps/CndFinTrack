module Member::PaymentsHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/payments"].merge(path: member_company_payments_path(@company))
    if controller_name == 'payments'
      result << controller_items[:"member/payments"].merge(path: edit_member_company_payment_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/payments"].merge(path: new_member_company_payment_path(@company), title: 'New payment') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/payments'].merge(path: new_member_company_payment_path(@company), title: 'Add new payment') if position == :top and action_name == 'index'
  end
end
