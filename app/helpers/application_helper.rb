module ApplicationHelper
  CONTROLLERS = {
    "member/dashboard": { title: 'Dashboard', icon: 'layout-dashboard' },
    "member/teams": { title: 'Teams', icon: 'users-group' },
    "member/companies": { title: 'Companies', icon: 'buildings' },
    "member/customers": { title: 'Customers', icon: 'briefcase' },
    "member/tags": { title: 'Tags', icon: 'tags' },
    "member/categories": { title: 'Categories', icon: 'category' },
    "member/suppliers": { title: 'Supplier', icon: 'truck' },
    "member/expenses": { title: 'Expenses', icon: 'file-dollar' },
    "member/invoices": { title: 'Invoices', icon: 'file-invoice' },
    "member/payments": { title: 'Payments', icon: 'credit-card-pay' },
    "member/products": { title: 'Products', icon: 'box' },
    "member/quotes": { title: 'Quotes', icon: 'file-barcode' },
    "member/tax_yearlies": { title: 'Tax yearly', icon: 'tax' },
    "member/tax_returns": { title: 'Tax return', icon: 'receipt-tax' }
  }

  def controller_items
    ApplicationHelper::CONTROLLERS
  end

  def menu
    []
  end

  def breadcrumbs; end

  def current_route_helper_name
    route_details = Rails.application.routes.recognize_path(request.path)
    route = Rails.application.routes.routes.find do |r|
      r.defaults[:controller] == route_details[:controller] && r.defaults[:action] == route_details[:action]
    end
    route ? "#{route.name}" : nil
  end

  def controller_from_path(path)
    return nil if path.blank?
    clean_path = URI.parse(path).path
    route_params = Rails.application.routes.recognize_path(clean_path)
    route_params[:controller].to_sym
  rescue ActionController::RoutingError
    nil
  end

  def page_title
    item = breadcrumbs.last
    logger.debug item
    capture do
      concat icon(item[:icon]) if item[:icon].present?
      concat ' '
      concat item[:page_title] || item[:title]
    end
  end

  def form_url
    @item
  end

  def province_options(country_code)
    # On cherche le pays via son code ISO (ex: "CA", "FR")
    country = Carmen::Country.coded(country_code)

    if country
      # On récupère les subdivisions (provinces/états)
      country.subregions.map { |s| [ s.name, s.code ] }
    else
      []
    end
  end

  def add_button(position); end


  def search
    false
  end
end
