# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railspaintshop_session',
  :secret      => 'a58eb3934282f64f617d5bdffaa661b0a24eb2202d8f52c80302a66e88c6217f22192b173657d5d1fe1e1dea4f7f635261d5c4099d24586338f03144f4a6c516'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
