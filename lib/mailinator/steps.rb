When /I wait (\d+) seconds for mail to process/ do |count|
  sleep(count.to_i)
end

Then "I should have one email in my inbox" do
  pending
end

Then /^the email subject should match \/(.*)\/$/ do |subject_regexp|
  last_mailinator_email.should have_subject(Regexp.new(subject_regexp))
end

Then /^the email body should match \/(.*)\/$/ do |body_regexp|
  last_mailinator_email.should have_body_text(Regexp.new(body_regexp))
end
