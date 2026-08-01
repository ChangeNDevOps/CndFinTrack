module Member::QuotesHelper
  def form_definition
    [ :member, @company, @item ]
  end

  def breadcrumbs
    result = super
    result << controller_items[:"member/quotes"].merge(path: member_company_quotes_path(@company))
    if controller_name == 'quotes'
      result << controller_items[:"member/quotes"].merge(path: edit_member_company_quote_path(@company, @item), title: 'Edit', page_title: "Edit #{@item.name}") if action_name == 'edit'
      result << controller_items[:"member/quotes"].merge(path: new_member_company_quote_path(@company), title: 'New quote') if action_name == 'new'
    end
    result
  end

  def add_button(position)
    controller_items[:'member/quotes'].merge(path: new_member_company_quote_path(@company), title: 'Add new quote') if position == :top and action_name == 'index'
  end

  def search
    true
  end
end
