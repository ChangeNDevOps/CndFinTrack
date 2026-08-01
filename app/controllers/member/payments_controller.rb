class Member::PaymentsController < Member::CompaniesController
  private

  def back_path
    member_company_payments_path(@company)
  end

  def datum_name
    'Payment'
  end

  def datum
    @company.payments
  end

  def item_params
    return {} unless params[:payment].present?

    params.expect(payment: [ :invoice_id, :amount, :paid_on ])
  end

  def set_items
    @company = Company.find(params[:company_id])
  end
end
