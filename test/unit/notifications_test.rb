require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "grade" do
    @expected.subject = 'Notifications#grade'
    @expected.body    = read_fixture('grade')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_grade(@expected.date).encoded
  end

end
