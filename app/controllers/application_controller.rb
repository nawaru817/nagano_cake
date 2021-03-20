class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    end
  end

  def after_sign_out_path_for(resource)
    admin_root_path
  end
end
