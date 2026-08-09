class Member::CompaniesController < Member::ApplicationController
  private

  def back_path
    member_companies_path
  end

  def datum_name
    'Company'
  end

  def datum
    return Company if %w[new create edit update].include? action_name

    Current.companies
  end

  def set_item
    super
    @company = @item if controller_name == 'companies'
  end

  def item_params
    unless params[:company].present?
      return {}
    end
    params.expect(company: [ :name, :team_id ])
  end
end
