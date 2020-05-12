require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: 'user', last_name: 'tester', email:'test@test.com', password: 'password') }

  context 'sign up validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without selecting type of user' do
      subject.is_mentor? = ''
      expect(subject).to_not be_valid
    end

  end
end
