require 'rails_helper'

RSpec.describe Device, type: :model do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:mac) }
    it { is_expected.to validate_uniqueness_of(:mac) }
end
