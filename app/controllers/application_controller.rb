class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_for_payment_method, if: :user_signed_in?

  def check_for_payment_method

    unless current_user.stripe_customer_id

      #redirect_to payments_path

    end

  end

  def configure_permitted_parameters

		registration_params = [:email, :password]
		devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
		devise_parameter_sanitizer.permit(:sign_in, keys: registration_params)
		devise_parameter_sanitizer.permit(:account_update, keys: registration_params)

	end


	def after_sign_in_path_for(user)

		unless current_user.id

			payments_path

		else

      if current_user.stripe_customer_id
			   root_path
      else
        payments_path
      end

    end

  end

end
