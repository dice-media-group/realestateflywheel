Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

class RecordCharges
  def call(event)
    charge = event.data.object

    # Look up the user in our database
    user = User.find_by(stripe_id: charge.customer)

    # Record a charge in our database
    c = user.charges.where(stripe_id: charge.id).first_or_create
    c.update(
      amount: charge.amount,
      card_last4: charge.last4,
      card_type: charge.brand,
      card_exp_month: charge.exp_month,
      card_exp_year: charge.exp_year
    )
  end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end

 
