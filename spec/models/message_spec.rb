RSpec.describe Message, type: :model do
  it "exists" do
    message = Message.new
    assert_instance_of Message, message
  end
end
