# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
#ActionController::Base.session = {
#   :key         => '_golfmanager_session',
#   :secret      => '7e26333ff8cb38d6599352d9b7ba9a179d4bddec9c0fd619f2480cd5d263edeb871c1b679a9394371ef354cf319c1d22691b399b83ded1fc0d4d0fe7dc33fbe5'
# }

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
