require './app/models/user'

describe User do
  describe '.authenticate' do
    before do 
      user = User.new(username: 'test101', name: 'Test Person', email: 'test@test.com')
      user.password = 'test12'
      user.save!
    end
    it 'can authenticate when valid' do
      described_class.authenticate(username: 'test101', password: 'test12')
      expect(user).not_to eq nil
    end
    it 'returns nil when username invalid' do
      described_class.authenticate(username: 'test101', password: 'test12')
      expect(user).not_to eq nil
    end
    it 'return nil when password invalid' do
        described_class.authenticate(username: 'test101', password: 'test12')
        expect(user).not_to eq nil
    end
  end
end