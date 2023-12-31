require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should have_many(:shifts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
