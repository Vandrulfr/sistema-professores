require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, :admin) }
  subject { user }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'methods' do
    it { expect(user.admin?).to be_truthy }
    it { expect(user.sec?).to be_falsey }
  end

end