# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account/apikeys
Stripe.api_key = "sk_test_9VpS38h5AdEx6NZHv3YZBMjc"
STRIPE_PUBLIC_KEY = "pk_test_ZDN2Yx9XnJy94E7vBaQ3CkC5"

# # Get the credit card details submitted by the form
# token = params[:stripeToken]
#
# # Create the charge on Stripe's servers - this will charge the user's card
# begin
#   charge = Stripe::Charge.create(
#     :amount => 1000, # amount in cents, again
#     :currency => "usd",
#     :source => token,
#     :description => "Example charge"
#   )
# rescue Stripe::CardError => e
#   # The card has been declined
# end
