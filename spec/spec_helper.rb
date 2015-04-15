$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

MODELS = File.join(File.dirname(__FILE__), 'app/models')
$LOAD_PATH.unshift(MODELS)

require 'mongoid'
require 'mongoid_optimistic_lock'

ENV['WERCKER_MONGODB_HOST'] ||= 'localhost:27017'

HOST = ENV['WERCKER_MONGODB_HOST']

CONFIG = {
    sessions: {
        default: {
            database: 'mongoid_optimistic_lock_test', hosts: [ HOST ]
        }
    }
}

Mongoid.configure do |config|
  config.load_configuration(CONFIG)
end

# Autoload every model for the test suite that sits in spec/app/models.
Dir[ File.join(MODELS, '*.rb') ].sort.each do |file|
  name = File.basename(file, '.rb')
  autoload name.camelize.to_sym, name
end

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
  end
end
