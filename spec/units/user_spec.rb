require './app/models/user'

describe User do
  describe '.authenticate' do
    let(:user) { User.new(username: 'test101', name: 'Test Person', email: 'test@test.com') }
    before do
      user.password = 'test12'
      user.save!
    end

    it 'can authenticate when valid' do
      test_user = described_class.authenticate(username: 'test101', password: 'test12')
      expect(test_user).not_to eq nil
    end

    it 'returns nil when username invalid' do
      test_user = described_class.authenticate(username: 'incorrect_name', password: 'test12')
      expect(test_user).to eq nil
    end

    it 'return nil when password invalid' do
        test_user = described_class.authenticate(username: 'test101', password: 'incorrect')
        expect(test_user).to eq nil
    end

    it 'return nil when both username and password are invalid' do
        test_user = described_class.authenticate(username: 'alsoincorrect', password: 'incorrect')
        expect(test_user).to eq nil
    end

  end
end
