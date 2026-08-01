class Member::TagsController < Member::CompaniesController
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
    member_company_tags_path(@company)
  end

  def datum_name
    'Tag'
  end

  def datum
    @company.tags
  end

  def item_params
    return {} unless params[:tag].present?

    params.expect(tag: [ :name ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
