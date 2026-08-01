class Member::QuotesController < Member::CompaniesController
  before_action :set_item, only: [ :show, :edit, :update, :destroy, :approve, :reject ]
  def index
    @item = datum.new(item_params)
    @query = @item.name.presence || '*'

    search_options = {
      hitsPerPage: 20,
      attributesToHighlight: [ 'name' ],
      filter: []
    }

    if @item.customer_id.present?
      search_options[:filter] << "customer_id = #{@item.customer_id}"
    end

    @pagy, @items = pagy(datum.search(@query, search_options))
  end
  def new
    super
    @item.quote_items.build
  end

  def edit
  end

  def approve
    @item.update(approved_at: Time.zone.now, rejected_at: nil)
    redirect_to back_path
  end

  def reject
    @item.update(rejected_at: Time.zone.now, approved_at: nil)
    redirect_to back_path
  end

  private

  def back_path
    member_company_quotes_path(@company)
  end

  def datum_name
    'Quote'
  end

  def datum
    @company.quotes
  end

  def item_params
    return {} unless params[:quote].present?

    params.expect(quote: [ :customer_id, :name, :available_on, :available_duration_in_month, :status,
                           tag_ids: [],
                           quote_items_attributes: [ [ :id, :product_id, :quantity,  :unit_price, :_destroy ] ] ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
