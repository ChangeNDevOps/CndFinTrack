class Member::ExpensesController < Member::CompaniesController
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
    member_company_expenses_path(@company)
  end

  def datum_name
    'Expense'
  end

  def datum
    @company.expenses
  end

  def item_params
    return {} unless params[:expense].present?

    params.expect(expense: [ :supplier_id, :name, :amount, :taxable, :invoiced_on, :paid_on, tag_ids: [] ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
