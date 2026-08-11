class Member::DashboardController < Member::ApplicationController
  def index
    if controller_name != 'dashboard'
      super
    else
    end
  end
end
