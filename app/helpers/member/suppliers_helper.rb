module Member::SuppliersHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/suppliers"].merge(path: member_company_suppliers_path(@company))
    if controller_name == 'suppliers'
      result << controller_items[:"member/suppliers"].merge(path: edit_member_company_supplier_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/suppliers"].merge(path: new_member_company_supplier_path(@company), title: 'New supplier') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/suppliers'].merge(path: new_member_company_supplier_path(@company), title: 'Add new supplier') if position == :top and action_name == 'index'
  end
end
