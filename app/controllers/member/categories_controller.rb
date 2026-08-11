class Member::CategoriesController < Member::CompaniesController
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
    member_company_categories_path(@company)
  end

  def datum_name
    'Category'
  end

  def datum
    @company.categories
  end

  def item_params
    return {} unless params[:category].present?

    params.expect(category: [ :name ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
