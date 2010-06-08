require File.join(File.dirname(__FILE__), '..', 'spec_helper')

require 'mailinator/spec'

require 'pony'
require 'email-spec'

describe "Mailinator specs" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  include Mailinator::Helpers

  before do

    @mailinator = Mailinator.new('lkjdaslkjfaad')

    Pony.mail(:to => @mailinator, :from => 'josh@railsmachine.com', :subject => 'mailinator spec', :body => 'zomg')
  end

  it "should be sweet" do

  end

end
