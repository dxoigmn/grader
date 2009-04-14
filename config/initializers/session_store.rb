# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grader.git_session',
  :secret      => 'eb9ed282b00142e6a7344e31f90b323cc237c1114ea14e511884fbd089b8392f9bb8b6ffae13932e2d879572107fbcea4733ae97cc6f5c6c73d0b833531f7404'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
