RSpec.describe User, type: :model do
  it "exists" do
    user = User.new
    assert_instance_of User, user
  end
end
