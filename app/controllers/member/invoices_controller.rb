class Member::InvoicesController < Member::CompaniesController
  def index
    @item = datum.new(item_params)
    @query = '*' # @item.name.presence ||

    search_options = {
      hitsPerPage: 20,
      attributesToHighlight: [ 'name' ],
      filter: []
    }

    # if @item.customer_id.present?
    #   search_options[:filter] << "customer_id = #{@item.customer_id}"
    # end

    @pagy, @items = pagy(datum.search(@query, search_options))
  end
  def new
    @item = datum.new(item_params)
  end

  private

  def back_path
    member_company_invoices_path(@company)
  end

  def datum_name
    'Invoice'
  end

  def datum
    @company.invoices
  end

  def item_params
    return {} unless params[:invoice].present?

    params.expect(invoice: [ :quote_id, :invoiced_on, :due_on, :taxable ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
