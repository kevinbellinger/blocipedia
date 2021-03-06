class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    # @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :plan => "Premium",
      :card  => params[:stripeToken]
      )

    #adding writeback to customer account for access.
    current_user.update_attribute(:role, "premium")
    redirect_to wikis_path, flash: { notice: "You are now subscribed to Blocipedia!" }

  #  charge = Stripe::Charge.create(
   #   :customer    => customer.id,
    #  :amount      => @amount,
     # :description => 'Rails Stripe customer',
     # :currency    => 'usd'
   # )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

end
