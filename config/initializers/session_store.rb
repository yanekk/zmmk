# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zmkk_session',
  :secret      => '131de9d71548ba791f6f4f1f3768da3f45f50817c5a5aad0c7e4074ff7d5812be2ade5f220c11d8994a5400a18ba48dc387bb00e5513078f0a72fe84ea629bab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
