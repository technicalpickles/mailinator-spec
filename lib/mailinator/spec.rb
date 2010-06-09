require 'mailinator'
require 'email-spec'

class Mailinator
  module Spec
    module Matchers
      include EmailSpec::Matchers
    end

    module Helpers

      def mailinator(email = nil)
        @mailinator ||= begin
                          if email
                            Mailinator.new(email)
                          else
                            Mailinator.mostly_random
                          end
                        end
      end

      def last_mailinator_email
        mailinator.mailbox.last
      end

    end

  end
end
