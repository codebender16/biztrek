require 'rails_helper'

RSpec.describe Mentor, type: :model do
  let(:user) { User.create(first_name: 'mentor', last_name: 'tester', email:'test@test.com', password: 'password') }
  subject { Mentor.new(description: 'Test Description', expertise: 'Test Expertise', business: 'Test Business', industry: 'Test Industry', user_id: user.id) }

  context 'associations between model and other models' do
    
    it "should belong to a user" do
      relation = Mentor.reflect_on_association(:user) 
      expect(relation.macro).to eql(:belongs_to) 
    end

    it 'it should have many courses' do
      relation = Mentor.reflect_on_association(:courses)
      expect(relation.macro).to eql(:has_many)
    end
    
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without expertise' do
      subject.expertise = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without business' do
      subject.business = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without industry' do
      subject.industry = nil
      expect(subject).to_not be_valid
    end


  end

  
end
