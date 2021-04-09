require 'test_helper'

class JobMailerTest < ActionMailer::TestCase
  test "newjob" do
    mail = JobMailer.newjob
    assert_equal "Newjob", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
