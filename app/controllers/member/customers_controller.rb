class Member::CustomersController < Member::CompaniesController
  def index
    @item = datum.new(item_params)
    @query = @item.name || '*'

    search_options = {
      hitsPerPage: 20,
      attributesToHighlight: [ 'name' ]
    }

    @pagy, @items = pagy(datum.search(@query, search_options))
  end

  private

  def back_path
    member_company_customers_path(@company)
  end

  def datum_name
    'Customer'
  end

  def datum
    @company.customers.active
  end

  def item_params
    return {} unless params[:customer].present?

    params.expect(customer: [ :name, :address1, :address2, :city, :zip, :prefix, :country_code, :province_code, :status, tag_ids: [] ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
