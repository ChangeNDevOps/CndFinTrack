class Member::ProductsController < Member::CompaniesController
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
    member_company_products_path(@company)
  end

  def datum_name
    'Expense'
  end

  def datum
    @company.products
  end

  def item_params
    return {} unless params[:product].present?

    params.expect(product: [ :name, :description, :unit_price, :category_price, :status, tag_ids: [] ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
