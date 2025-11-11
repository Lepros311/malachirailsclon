Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

# Find your secret key on the Stripe dashboard.
# Then go to the editor and put it in there.
# EDITOR="code --wait" rails credentials:edit (do this in the terminal)
# Also add the price id's for monthly and yearly prices in the editor (pages.controller.rb lines 14 and 16)
# Set to test mode in Stripe to test
