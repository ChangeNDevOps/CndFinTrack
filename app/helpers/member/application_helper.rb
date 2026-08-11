module Member::ApplicationHelper
  def form_definition
    [ :member, @item ]
  end

  def breadcrumbs
    [ controller_items[:"member/dashboard"].merge(path: member_root_path) ]
  end

  def item_for(route, start_with: true, restfull: false)
    # current_route = current_route_helper_name.to_sym
    controller = controller_from_path(route)
    # logger.debug "Request Path: #{request.path}"
    # logger.debug "Actual route: #{route}"

    paths = restfull == true ? [ new_member_company_path, (@company ? edit_member_company_path(@company) : nil), route ] : [ route ]
    # logger.debug controller
    # logger.debug '----'.red
    {
      title: controller_items[controller][:title],
      icon: controller_items[controller][:icon],
      controllers: [ controller ],
      path: route,
      active: start_with == true ? request.path.start_with?(route) : paths.include?(request.path)
    }
  end

  def items_for_company(company)
    current_route = current_route_helper_name.to_sym
    result = []
    result << item_for(member_company_path(company), start_with: false).merge(title: "#{company.name} details")
    result << item_for(member_company_customers_path(company))
    result << item_for(member_company_suppliers_path(company))
    result << item_for(member_company_expenses_path(company))
    result << item_for(member_company_quotes_path(company))
    result << item_for(member_company_invoices_path(company))
    result << item_for(member_company_payments_path(company))
    result << item_for(member_company_products_path(company))
    result << item_for(member_company_categories_path(company))
    result << item_for(member_company_tags_path(company))
    result
  end

  def items_for_companies
    all_companies = []
    Current.companies.each do |item|
      data = item_for(member_company_path(item)).except(:path).merge(title: item.name)
      data[:items] = items_for_company(item)
      data[:paths] = data[:items].flat_map { |h| h[:path] }
      data[:active] = data[:items].any? { |hash| hash[:active] == true }
      all_companies << data
    end
    items = [ item_for(member_companies_path, start_with: false, restfull: true).merge(title: 'All companies') ]+ all_companies
    active = items.any? { |hash| hash[:active] == true }
    item_for(member_companies_path).except(:path).merge(items: items, active: active)
  end

  def nav_menu_simple
    [
      item_for(member_root_path),
      item_for(member_teams_path),
      items_for_companies
    ].compact
  end

  def nav_menu_simple_complete
    logger.debug nav_menu_simple.to_yaml
  end
end
