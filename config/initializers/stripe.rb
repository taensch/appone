if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_CEYbdyxElR6To4V51JO5amGO',
    :secret_key => 'sk_test_hj93Z7aZKo7G3grb8odUZ2lP'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]