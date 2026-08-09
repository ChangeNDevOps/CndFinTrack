module Member::InvoicesHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/invoices"].merge(path: member_company_invoices_path(@company))
    if controller_name == 'invoices'
      result << controller_items[:"member/invoices"].merge(path: edit_member_company_invoice_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.quote.name}") if action_name == 'edit'
      result << controller_items[:"member/invoices"].merge(path: new_member_company_invoice_path(@company), title: 'New invoice') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/invoices'].merge(path: new_member_company_invoice_path(@company), title: 'Add new invoice') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
