Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBKEY'],
  :secret_key      => ENV['STRIPE_SECKEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]