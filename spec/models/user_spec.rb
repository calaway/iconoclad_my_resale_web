require 'rails_helper'

describe User, type: :model do
  context 'when user is an admin' do
    it '.admin?' do
      expect(described_class.admin?('12345678901234567')).to be(true)
    end
  end

  context 'when user is not an admin' do
    it '.admin?' do
      expect(described_class.admin?('00000000000000001')).to be(false)
    end
  end
end
