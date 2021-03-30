class ApplicationController < ActionController::Base


  protected

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_items_path

      when Customer
        items_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when Admin
        admin_root_path

      when Customer
        root_path
    end
  end

end
