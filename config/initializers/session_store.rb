# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shoutie_session',
  :secret      => '00f42bd2e568a0ecdb5e61c9980168a83c602a3078d61fa5825adc41b8d079ba5d4ceb0c5e1e7abcca42bc0aa0cd15f92af51a169064c70468a9177f908ebd4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
