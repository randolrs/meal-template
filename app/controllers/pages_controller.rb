class PagesController < ApplicationController
  def home
    @meal_templates = MealTemplate.all
  end

  def login

    @hide_navigation = true

  end

  def signup

    @hide_navigation = true

  end

  def payments

    @hide_navigation = true

  end

  def create_payment_method

    if user_signed_in?

    ccNumber = params[:cc_number]
    ccName = params[:cc_name]
    ccExpMonth = params[:cc_exp_month]
    ccExpYear = params[:cc_exp_year]
    ccCVC = params[:cc_cvc]

    if (ccNumber && ccName && ccExpMonth && ccExpYear)

      Stripe.api_key = ENV["STRIPE_LIVE_SECRET_KEY"]

      token = Stripe::Token.create(

        :card => {
          :number => ccNumber,
          :exp_month => ccExpMonth,
          :exp_year => ccExpYear,
          :cvc => ccCVC

        },
      )

      customer = Stripe::Customer.create(
        :description => "Customer for mealtemplate",
        :source => token.id # obtained with Stripe.js
      )

      Stripe::Subscription.create(
        :customer => customer.id,
        :items => [
          {
            :plan => "basic",
          },
        ]
      )

      current_user.update(:stripe_customer_id => customer.id)

      redirect_to root_path
    else

      redirect_to payments_path

    end

  else
    redirect_to login_path
  end

  end

end
