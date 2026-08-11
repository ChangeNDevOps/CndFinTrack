class Member::TaxReturnsController < Member::CompaniesController
  def create
    @item = TaxReturn.new
    @item.start_at = @tax_yearly.start_at.advance(months: @tax_yearly.tax_returns.count * @tax_yearly.tax_return_duration_in_month)
    @item.company = @company
    @item.tax_yearly = @tax_yearly
    if @item.save
      redirect_to back_path, notice: "#{datum_name.capitalize} #{t('globals.created')}."
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def back_path
    member_company_tax_yearlies_path(@company)
  end

  def datum_name
    'TaxReturn'
  end

  def datum
    @company.tax_returns
  end

  def item_params
    return {} unless params[:tax_return].present?

    params.expect(tax_return: [ :company_id, :tax_yearly, :start_at ])
  end

  def set_items
    @company = Company.find(params[:company_id])
    @tax_yearly = @company.tax_yearlies.find(params[:tax_yearly_id])
  end
end
