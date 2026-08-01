module Member::ProductsHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/products"].merge(path: member_company_products_path(@company))
    if controller_name == 'products'
      result << controller_items[:"member/products"].merge(path: edit_member_company_product_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/products"].merge(path: new_member_company_product_path(@company), title: 'New product') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/products'].merge(path: new_member_company_product_path(@company), title: 'Add new product') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
