$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

require 'mailinator'
require 'mailinator/spec'
require 'mailinator/steps'
require 'email-spec'

World(Mailinator::Spec::Helpers)
World(Mailinator::Spec::Matchers)
