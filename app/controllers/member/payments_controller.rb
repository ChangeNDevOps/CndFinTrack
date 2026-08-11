class Member::PaymentsController < Member::CompaniesController
  def new
    @item = Payment.new(item_params)
  end

  def create
    @item = Payment.new(item_params)
    if @item.save
      redirect_to back_path, notice: "#{datum_name.capitalize} #{t('globals.created')}."
    else
      render :new, status: :unprocessable_entity
    end
  end

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
