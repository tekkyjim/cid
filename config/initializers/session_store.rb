# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cid_session',
  :secret      => 'c40faf60851b41ec45026f27998825aecb501b0d55c6453faf81e333985d177f817e05d45ff3db20f8fde001ada4751f5fafd68bf7d4e78bd0af8d75f191d89f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
