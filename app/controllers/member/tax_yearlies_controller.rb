class Member::TaxYearliesController < Member::CompaniesController
  def new
    @item = datum.new(item_params)
    @item.tps_rate = Company::TPS_TAX
    @item.tvq_rate = Company::TVQ_TAX
  end

  private

  def back_path
    member_company_tax_yearlies_path(@company)
  end

  def datum_name
    'TaxYearly'
  end

  def datum
    @company.tax_yearlies
  end

  def item_params
    return {} unless params[:tax_yearly].present?

    params.expect(tax_yearly: [ :company_id, :tax_return_duration_in_month, :start_at, :tps_rate, :tvq_rate ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
